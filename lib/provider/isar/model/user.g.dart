// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors

extension GetIsarUserCollection on Isar {
  IsarCollection<String, IsarUser> get users => this.collection();
}

const IsarUserSchema = IsarCollectionSchema(
  schema:
      '{"name":"User","idName":"id","properties":[{"name":"user","type":"Json"},{"name":"id","type":"String"},{"name":"createdAt","type":"DateTime"}]}',
  converter: IsarObjectConverter<String, IsarUser>(
    serialize: serializeIsarUser,
    deserialize: deserializeIsarUser,
    deserializeProperty: deserializeIsarUserProp,
  ),
  embeddedSchemas: [],
  //hash: -1491677052114951409,
);

@isarProtected
int serializeIsarUser(IsarWriter writer, IsarUser object) {
  IsarCore.writeString(writer, 1, isarJsonEncode(object.user));
  IsarCore.writeString(writer, 2, object.id);
  IsarCore.writeLong(
      writer, 3, object.createdAt.toUtc().microsecondsSinceEpoch);
  return Isar.fastHash(object.id);
}

@isarProtected
IsarUser deserializeIsarUser(IsarReader reader) {
  final User _user;
  {
    final json = isarJsonDecode(IsarCore.readString(reader, 1) ?? 'null');
    if (json is Map<String, dynamic>) {
      _user = User.fromJson(json);
    } else {
      _user = User(
        UserId(
          '',
        ),
        createdAt:
            DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal(),
      );
    }
  }
  final object = IsarUser(
    _user,
  );
  return object;
}

@isarProtected
dynamic deserializeIsarUserProp(IsarReader reader, int property) {
  switch (property) {
    case 1:
      {
        final json = isarJsonDecode(IsarCore.readString(reader, 1) ?? 'null');
        if (json is Map<String, dynamic>) {
          return User.fromJson(json);
        } else {
          return User(
            UserId(
              '',
            ),
            createdAt:
                DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal(),
          );
        }
      }
    case 2:
      return IsarCore.readString(reader, 2) ?? '';
    case 3:
      {
        final value = IsarCore.readLong(reader, 3);
        if (value == -9223372036854775808) {
          return DateTime.fromMillisecondsSinceEpoch(0, isUtc: true).toLocal();
        } else {
          return DateTime.fromMicrosecondsSinceEpoch(value, isUtc: true)
              .toLocal();
        }
      }
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _IsarUserUpdate {
  bool call({
    required String id,
    DateTime? createdAt,
  });
}

class _IsarUserUpdateImpl implements _IsarUserUpdate {
  const _IsarUserUpdateImpl(this.collection);

  final IsarCollection<String, IsarUser> collection;

  @override
  bool call({
    required String id,
    Object? createdAt = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (createdAt != ignore) 3: createdAt as DateTime?,
        }) >
        0;
  }
}

sealed class _IsarUserUpdateAll {
  int call({
    required List<String> id,
    DateTime? createdAt,
  });
}

class _IsarUserUpdateAllImpl implements _IsarUserUpdateAll {
  const _IsarUserUpdateAllImpl(this.collection);

  final IsarCollection<String, IsarUser> collection;

  @override
  int call({
    required List<String> id,
    Object? createdAt = ignore,
  }) {
    return collection.updateProperties(id, {
      if (createdAt != ignore) 3: createdAt as DateTime?,
    });
  }
}

extension IsarUserUpdate on IsarCollection<String, IsarUser> {
  _IsarUserUpdate get update => _IsarUserUpdateImpl(this);

  _IsarUserUpdateAll get updateAll => _IsarUserUpdateAllImpl(this);
}

sealed class _IsarUserQueryUpdate {
  int call({
    DateTime? createdAt,
  });
}

class _IsarUserQueryUpdateImpl implements _IsarUserQueryUpdate {
  const _IsarUserQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<IsarUser> query;
  final int? limit;

  @override
  int call({
    Object? createdAt = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (createdAt != ignore) 3: createdAt as DateTime?,
    });
  }
}

extension IsarUserQueryUpdate on IsarQuery<IsarUser> {
  _IsarUserQueryUpdate get updateFirst =>
      _IsarUserQueryUpdateImpl(this, limit: 1);

  _IsarUserQueryUpdate get updateAll => _IsarUserQueryUpdateImpl(this);
}

extension IsarUserQueryFilter
    on QueryBuilder<IsarUser, IsarUser, QFilterCondition> {
  QueryBuilder<IsarUser, IsarUser, QAfterFilterCondition> idEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarUser, IsarUser, QAfterFilterCondition> idGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarUser, IsarUser, QAfterFilterCondition>
      idGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarUser, IsarUser, QAfterFilterCondition> idLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarUser, IsarUser, QAfterFilterCondition> idLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarUser, IsarUser, QAfterFilterCondition> idBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarUser, IsarUser, QAfterFilterCondition> idStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarUser, IsarUser, QAfterFilterCondition> idEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarUser, IsarUser, QAfterFilterCondition> idContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarUser, IsarUser, QAfterFilterCondition> idMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 2,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<IsarUser, IsarUser, QAfterFilterCondition> idIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<IsarUser, IsarUser, QAfterFilterCondition> idIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<IsarUser, IsarUser, QAfterFilterCondition> createdAtEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarUser, IsarUser, QAfterFilterCondition> createdAtGreaterThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarUser, IsarUser, QAfterFilterCondition>
      createdAtGreaterThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarUser, IsarUser, QAfterFilterCondition> createdAtLessThan(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarUser, IsarUser, QAfterFilterCondition>
      createdAtLessThanOrEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 3,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<IsarUser, IsarUser, QAfterFilterCondition> createdAtBetween(
    DateTime lower,
    DateTime upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 3,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }
}

extension IsarUserQueryObject
    on QueryBuilder<IsarUser, IsarUser, QFilterCondition> {}

extension IsarUserQuerySortBy on QueryBuilder<IsarUser, IsarUser, QSortBy> {
  QueryBuilder<IsarUser, IsarUser, QAfterSortBy> sortByUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<IsarUser, IsarUser, QAfterSortBy> sortByUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }

  QueryBuilder<IsarUser, IsarUser, QAfterSortBy> sortById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<IsarUser, IsarUser, QAfterSortBy> sortByIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<IsarUser, IsarUser, QAfterSortBy> sortByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<IsarUser, IsarUser, QAfterSortBy> sortByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }
}

extension IsarUserQuerySortThenBy
    on QueryBuilder<IsarUser, IsarUser, QSortThenBy> {
  QueryBuilder<IsarUser, IsarUser, QAfterSortBy> thenByUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1);
    });
  }

  QueryBuilder<IsarUser, IsarUser, QAfterSortBy> thenByUserDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc);
    });
  }

  QueryBuilder<IsarUser, IsarUser, QAfterSortBy> thenById(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarUser, IsarUser, QAfterSortBy> thenByIdDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<IsarUser, IsarUser, QAfterSortBy> thenByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3);
    });
  }

  QueryBuilder<IsarUser, IsarUser, QAfterSortBy> thenByCreatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc);
    });
  }
}

extension IsarUserQueryWhereDistinct
    on QueryBuilder<IsarUser, IsarUser, QDistinct> {
  QueryBuilder<IsarUser, IsarUser, QAfterDistinct> distinctByUser() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1);
    });
  }

  QueryBuilder<IsarUser, IsarUser, QAfterDistinct> distinctByCreatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3);
    });
  }
}

extension IsarUserQueryProperty1
    on QueryBuilder<IsarUser, IsarUser, QProperty> {
  QueryBuilder<IsarUser, User, QAfterProperty> userProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<IsarUser, String, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<IsarUser, DateTime, QAfterProperty> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }
}

extension IsarUserQueryProperty2<R>
    on QueryBuilder<IsarUser, R, QAfterProperty> {
  QueryBuilder<IsarUser, (R, User), QAfterProperty> userProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<IsarUser, (R, String), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<IsarUser, (R, DateTime), QAfterProperty> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }
}

extension IsarUserQueryProperty3<R1, R2>
    on QueryBuilder<IsarUser, (R1, R2), QAfterProperty> {
  QueryBuilder<IsarUser, (R1, R2, User), QOperations> userProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<IsarUser, (R1, R2, String), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<IsarUser, (R1, R2, DateTime), QOperations> createdAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }
}
