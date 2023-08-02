import 'package:collection/collection.dart';

import '/util/new_type.dart';

class User {
  User(
    this.id, {
    this.name,
    required this.createdAt,
  });

  User.fromJson(Map<String, dynamic> json)
      : id = UserId(json['id']),
        name = json['name'] == null ? null : UserName(json['name']),
        createdAt = DateTime.parse(json['createdAt']);

  final UserId id;
  UserName? name;
  final DateTime createdAt;

  Map<String, dynamic> toJson() => {
        'id': id.val,
        'name': name?.val,
        'createdAt': createdAt.toUtc().toIso8601String(),
      };

  @override
  bool operator ==(Object other) =>
      other is User &&
      id == other.id &&
      name == other.name &&
      createdAt == other.createdAt;

  User copyWith({UserName? name, DateTime? createdAt}) {
    return User(id, name: name ?? this.name, createdAt: this.createdAt);
  }
}

/// Unique ID of an [User].
///
/// See more details in [User.id].
class UserId extends NewType<String> {
  const UserId(super.val);
}

class UserName extends NewType<String> {
  const UserName(super.val);

  factory UserName.random() {
    return UserName(
      ['Mart', 'Dummy', 'Alice', 'Albert', 'Robert', 'Donkey'].sample(1).first,
    );
  }
}

/// 1. Обязательное поле `final int id;` <- связывает руки, нам нужна наша UUID по-хорошему.
/// РЕШЕНИЕ: Isar v4 даёт хранить строки в ID.
/// 
/// 2. Нет возможности делать кастомные поля.
/// РЕШЕНИЕ: DTO.
/// РЕШЕНИЕ: JSONы.
/// 
/// 3. Если хранить JSONы, то как делать `.where(chatId = chatId)`, например, на коллекции сообщений? 
/// РЕШЕНИЕ: DTO.
/// РЕШЕНИЕ: Отдельные коллекции для каждого чата?
/// 
/// Кодогенератор как универсальное решение всего? Кодогенератор создаёт DTOшки.
/// Но: нужно мейнтейнить.