// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_service.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetPreferencesCollection on Isar {
  IsarCollection<Preferences> get preferences => this.collection();
}

const PreferencesSchema = CollectionSchema(
  name: r'Preferences',
  id: 4252616732994050084,
  properties: {
    r'darkMode': PropertySchema(
      id: 0,
      name: r'darkMode',
      type: IsarType.bool,
    )
  },
  estimateSize: _preferencesEstimateSize,
  serialize: _preferencesSerialize,
  deserialize: _preferencesDeserialize,
  deserializeProp: _preferencesDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _preferencesGetId,
  getLinks: _preferencesGetLinks,
  attach: _preferencesAttach,
  version: '3.1.0+1',
);

int _preferencesEstimateSize(
  Preferences object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _preferencesSerialize(
  Preferences object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.darkMode);
}

Preferences _preferencesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Preferences();
  object.darkMode = reader.readBool(offsets[0]);
  object.id = id;
  return object;
}

P _preferencesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _preferencesGetId(Preferences object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _preferencesGetLinks(Preferences object) {
  return [];
}

void _preferencesAttach(
    IsarCollection<dynamic> col, Id id, Preferences object) {
  object.id = id;
}

extension PreferencesQueryWhereSort
    on QueryBuilder<Preferences, Preferences, QWhere> {
  QueryBuilder<Preferences, Preferences, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension PreferencesQueryWhere
    on QueryBuilder<Preferences, Preferences, QWhereClause> {
  QueryBuilder<Preferences, Preferences, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterWhereClause> idNotEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PreferencesQueryFilter
    on QueryBuilder<Preferences, Preferences, QFilterCondition> {
  QueryBuilder<Preferences, Preferences, QAfterFilterCondition> darkModeEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'darkMode',
        value: value,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension PreferencesQueryObject
    on QueryBuilder<Preferences, Preferences, QFilterCondition> {}

extension PreferencesQueryLinks
    on QueryBuilder<Preferences, Preferences, QFilterCondition> {}

extension PreferencesQuerySortBy
    on QueryBuilder<Preferences, Preferences, QSortBy> {
  QueryBuilder<Preferences, Preferences, QAfterSortBy> sortByDarkMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'darkMode', Sort.asc);
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterSortBy> sortByDarkModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'darkMode', Sort.desc);
    });
  }
}

extension PreferencesQuerySortThenBy
    on QueryBuilder<Preferences, Preferences, QSortThenBy> {
  QueryBuilder<Preferences, Preferences, QAfterSortBy> thenByDarkMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'darkMode', Sort.asc);
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterSortBy> thenByDarkModeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'darkMode', Sort.desc);
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Preferences, Preferences, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension PreferencesQueryWhereDistinct
    on QueryBuilder<Preferences, Preferences, QDistinct> {
  QueryBuilder<Preferences, Preferences, QDistinct> distinctByDarkMode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'darkMode');
    });
  }
}

extension PreferencesQueryProperty
    on QueryBuilder<Preferences, Preferences, QQueryProperty> {
  QueryBuilder<Preferences, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Preferences, bool, QQueryOperations> darkModeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'darkMode');
    });
  }
}

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetTopicStateCollection on Isar {
  IsarCollection<TopicState> get topicStates => this.collection();
}

const TopicStateSchema = CollectionSchema(
  name: r'TopicState',
  id: 2478718702904634660,
  properties: {
    r'queue': PropertySchema(
      id: 0,
      name: r'queue',
      type: IsarType.longList,
    )
  },
  estimateSize: _topicStateEstimateSize,
  serialize: _topicStateSerialize,
  deserialize: _topicStateDeserialize,
  deserializeProp: _topicStateDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _topicStateGetId,
  getLinks: _topicStateGetLinks,
  attach: _topicStateAttach,
  version: '3.1.0+1',
);

int _topicStateEstimateSize(
  TopicState object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.queue.length * 8;
  return bytesCount;
}

void _topicStateSerialize(
  TopicState object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLongList(offsets[0], object.queue);
}

TopicState _topicStateDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = TopicState(
    id,
    reader.readLongList(offsets[0]) ?? [],
  );
  return object;
}

P _topicStateDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLongList(offset) ?? []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _topicStateGetId(TopicState object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _topicStateGetLinks(TopicState object) {
  return [];
}

void _topicStateAttach(IsarCollection<dynamic> col, Id id, TopicState object) {
  object.id = id;
}

extension TopicStateQueryWhereSort
    on QueryBuilder<TopicState, TopicState, QWhere> {
  QueryBuilder<TopicState, TopicState, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension TopicStateQueryWhere
    on QueryBuilder<TopicState, TopicState, QWhereClause> {
  QueryBuilder<TopicState, TopicState, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<TopicState, TopicState, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<TopicState, TopicState, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<TopicState, TopicState, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<TopicState, TopicState, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension TopicStateQueryFilter
    on QueryBuilder<TopicState, TopicState, QFilterCondition> {
  QueryBuilder<TopicState, TopicState, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TopicState, TopicState, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TopicState, TopicState, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<TopicState, TopicState, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TopicState, TopicState, QAfterFilterCondition>
      queueElementEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'queue',
        value: value,
      ));
    });
  }

  QueryBuilder<TopicState, TopicState, QAfterFilterCondition>
      queueElementGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'queue',
        value: value,
      ));
    });
  }

  QueryBuilder<TopicState, TopicState, QAfterFilterCondition>
      queueElementLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'queue',
        value: value,
      ));
    });
  }

  QueryBuilder<TopicState, TopicState, QAfterFilterCondition>
      queueElementBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'queue',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<TopicState, TopicState, QAfterFilterCondition>
      queueLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'queue',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<TopicState, TopicState, QAfterFilterCondition> queueIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'queue',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<TopicState, TopicState, QAfterFilterCondition>
      queueIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'queue',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TopicState, TopicState, QAfterFilterCondition>
      queueLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'queue',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<TopicState, TopicState, QAfterFilterCondition>
      queueLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'queue',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<TopicState, TopicState, QAfterFilterCondition>
      queueLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'queue',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }
}

extension TopicStateQueryObject
    on QueryBuilder<TopicState, TopicState, QFilterCondition> {}

extension TopicStateQueryLinks
    on QueryBuilder<TopicState, TopicState, QFilterCondition> {}

extension TopicStateQuerySortBy
    on QueryBuilder<TopicState, TopicState, QSortBy> {}

extension TopicStateQuerySortThenBy
    on QueryBuilder<TopicState, TopicState, QSortThenBy> {
  QueryBuilder<TopicState, TopicState, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<TopicState, TopicState, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension TopicStateQueryWhereDistinct
    on QueryBuilder<TopicState, TopicState, QDistinct> {
  QueryBuilder<TopicState, TopicState, QDistinct> distinctByQueue() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'queue');
    });
  }
}

extension TopicStateQueryProperty
    on QueryBuilder<TopicState, TopicState, QQueryProperty> {
  QueryBuilder<TopicState, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<TopicState, List<int>, QQueryOperations> queueProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'queue');
    });
  }
}
