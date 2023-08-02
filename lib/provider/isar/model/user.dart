import 'package:isar/isar.dart';

import '/model/user.dart';

part 'user.g.dart';

@Collection(accessor: 'users')
@Name('User')
class IsarUser {
  IsarUser(this.user);

  String get id => user.id.val;
  DateTime get createdAt => user.createdAt;

  User user;

  @override
  operator ==(Object other) =>
      other is IsarUser &&
      id == other.id &&
      createdAt == other.createdAt &&
      user == other.user;

  IsarUser copyWith({User? user}) {
    return IsarUser(user ?? this.user);
  }
}
