import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

import 'model/user.dart';
import 'provider/isar/model/user.dart';
import 'util/obs.dart';

late final Isar isar;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  isar = Isar.open(
    schemas: [IsarUserSchema],
    directory: (await getApplicationDocumentsDirectory()).path,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  StreamSubscription? _subscription;

  final List<IsarUser> _users = [];

  @override
  void initState() {
    _subscription = isar.users
        .where()
        .sortByCreatedAtDesc()
        .watch(fireImmediately: true)
        .changes((m) => m.id)
        .listen((e) {
      print('${e.op} ${e.pos} ${e.element!.user.name?.val}');

      switch (e.op) {
        case OperationKind.added:
          _users.insert(e.pos, e.element);
          break;

        case OperationKind.removed:
          _users.removeAt(e.pos);
          break;

        case OperationKind.updated:
          _users[e.pos] = e.element;
          break;
      }

      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ..._users.map((e) {
            return ListTile(
              title: Text('${e.user.name}'),
              subtitle: Text('${e.user.id}\n${e.user.createdAt}'),
              isThreeLine: true,
              leading: IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: () => _refresh(e),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () => _delete(e),
              ),
            );
          }),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _add,
      ),
    );
  }

  void _add() {
    isar.write((isar) {
      isar.users.put(
        IsarUser(
          User(
            UserId(const Uuid().v4()),
            name: UserName.random(),
            createdAt: DateTime.now(),
          ),
        ),
      );
    });
  }

  void _refresh(IsarUser e) {
    isar.write((isar) {
      isar.users.put(
        e.copyWith(user: e.user.copyWith(name: UserName.random())),
      );
    });
  }

  void _delete(IsarUser e) {
    isar.write((isar) {
      isar.users.delete(e.id);
    });
  }
}

extension<T> on Stream<List<T>> {
  Stream<ListChangeNotification> changes(dynamic Function(T) getId) {
    List<T> last = [];

    return asyncExpand((e) async* {
      for (int i = 0; i < e.length; ++i) {
        final item = last.firstWhereOrNull((m) => getId(m) == getId(e[i]));
        if (item == null) {
          yield ListChangeNotification.added(e[i], i);
        } else {
          if (e[i] != item) {
            yield ListChangeNotification.updated(e[i], i);
          }
        }
      }

      for (int i = 0; i < last.length; ++i) {
        final item = e.firstWhereOrNull((m) => getId(m) == getId(last[i]));
        if (item == null) {
          yield ListChangeNotification.removed(last[i], i);
        }
      }

      last = e;
    });
  }
}
