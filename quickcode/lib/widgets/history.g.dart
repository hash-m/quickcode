// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'history.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCodeEntryCollection on Isar {
  IsarCollection<CodeEntry> get codeEntrys => this.collection();
}

const CodeEntrySchema = CollectionSchema(
  name: r'CodeEntry',
  id: -6115901737814423287,
  properties: {
    r'barcodeData': PropertySchema(
      id: 0,
      name: r'barcodeData',
      type: IsarType.string,
    ),
    r'isQrCode': PropertySchema(
      id: 1,
      name: r'isQrCode',
      type: IsarType.bool,
    ),
    r'timestamp': PropertySchema(
      id: 2,
      name: r'timestamp',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _codeEntryEstimateSize,
  serialize: _codeEntrySerialize,
  deserialize: _codeEntryDeserialize,
  deserializeProp: _codeEntryDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _codeEntryGetId,
  getLinks: _codeEntryGetLinks,
  attach: _codeEntryAttach,
  version: '3.1.0+1',
);

int _codeEntryEstimateSize(
  CodeEntry object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.barcodeData.length * 3;
  return bytesCount;
}

void _codeEntrySerialize(
  CodeEntry object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.barcodeData);
  writer.writeBool(offsets[1], object.isQrCode);
  writer.writeDateTime(offsets[2], object.timestamp);
}

CodeEntry _codeEntryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CodeEntry();
  object.barcodeData = reader.readString(offsets[0]);
  object.id = id;
  object.isQrCode = reader.readBool(offsets[1]);
  object.timestamp = reader.readDateTime(offsets[2]);
  return object;
}

P _codeEntryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _codeEntryGetId(CodeEntry object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _codeEntryGetLinks(CodeEntry object) {
  return [];
}

void _codeEntryAttach(IsarCollection<dynamic> col, Id id, CodeEntry object) {
  object.id = id;
}

extension CodeEntryQueryWhereSort
    on QueryBuilder<CodeEntry, CodeEntry, QWhere> {
  QueryBuilder<CodeEntry, CodeEntry, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CodeEntryQueryWhere
    on QueryBuilder<CodeEntry, CodeEntry, QWhereClause> {
  QueryBuilder<CodeEntry, CodeEntry, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CodeEntry, CodeEntry, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<CodeEntry, CodeEntry, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CodeEntry, CodeEntry, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CodeEntry, CodeEntry, QAfterWhereClause> idBetween(
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

extension CodeEntryQueryFilter
    on QueryBuilder<CodeEntry, CodeEntry, QFilterCondition> {
  QueryBuilder<CodeEntry, CodeEntry, QAfterFilterCondition> barcodeDataEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'barcodeData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CodeEntry, CodeEntry, QAfterFilterCondition>
      barcodeDataGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'barcodeData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CodeEntry, CodeEntry, QAfterFilterCondition> barcodeDataLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'barcodeData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CodeEntry, CodeEntry, QAfterFilterCondition> barcodeDataBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'barcodeData',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CodeEntry, CodeEntry, QAfterFilterCondition>
      barcodeDataStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'barcodeData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CodeEntry, CodeEntry, QAfterFilterCondition> barcodeDataEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'barcodeData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CodeEntry, CodeEntry, QAfterFilterCondition> barcodeDataContains(
      String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'barcodeData',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CodeEntry, CodeEntry, QAfterFilterCondition> barcodeDataMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'barcodeData',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CodeEntry, CodeEntry, QAfterFilterCondition>
      barcodeDataIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'barcodeData',
        value: '',
      ));
    });
  }

  QueryBuilder<CodeEntry, CodeEntry, QAfterFilterCondition>
      barcodeDataIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'barcodeData',
        value: '',
      ));
    });
  }

  QueryBuilder<CodeEntry, CodeEntry, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CodeEntry, CodeEntry, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<CodeEntry, CodeEntry, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<CodeEntry, CodeEntry, QAfterFilterCondition> idBetween(
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

  QueryBuilder<CodeEntry, CodeEntry, QAfterFilterCondition> isQrCodeEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isQrCode',
        value: value,
      ));
    });
  }

  QueryBuilder<CodeEntry, CodeEntry, QAfterFilterCondition> timestampEqualTo(
      DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<CodeEntry, CodeEntry, QAfterFilterCondition>
      timestampGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<CodeEntry, CodeEntry, QAfterFilterCondition> timestampLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'timestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<CodeEntry, CodeEntry, QAfterFilterCondition> timestampBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'timestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CodeEntryQueryObject
    on QueryBuilder<CodeEntry, CodeEntry, QFilterCondition> {}

extension CodeEntryQueryLinks
    on QueryBuilder<CodeEntry, CodeEntry, QFilterCondition> {}

extension CodeEntryQuerySortBy on QueryBuilder<CodeEntry, CodeEntry, QSortBy> {
  QueryBuilder<CodeEntry, CodeEntry, QAfterSortBy> sortByBarcodeData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barcodeData', Sort.asc);
    });
  }

  QueryBuilder<CodeEntry, CodeEntry, QAfterSortBy> sortByBarcodeDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barcodeData', Sort.desc);
    });
  }

  QueryBuilder<CodeEntry, CodeEntry, QAfterSortBy> sortByIsQrCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isQrCode', Sort.asc);
    });
  }

  QueryBuilder<CodeEntry, CodeEntry, QAfterSortBy> sortByIsQrCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isQrCode', Sort.desc);
    });
  }

  QueryBuilder<CodeEntry, CodeEntry, QAfterSortBy> sortByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<CodeEntry, CodeEntry, QAfterSortBy> sortByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension CodeEntryQuerySortThenBy
    on QueryBuilder<CodeEntry, CodeEntry, QSortThenBy> {
  QueryBuilder<CodeEntry, CodeEntry, QAfterSortBy> thenByBarcodeData() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barcodeData', Sort.asc);
    });
  }

  QueryBuilder<CodeEntry, CodeEntry, QAfterSortBy> thenByBarcodeDataDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'barcodeData', Sort.desc);
    });
  }

  QueryBuilder<CodeEntry, CodeEntry, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CodeEntry, CodeEntry, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CodeEntry, CodeEntry, QAfterSortBy> thenByIsQrCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isQrCode', Sort.asc);
    });
  }

  QueryBuilder<CodeEntry, CodeEntry, QAfterSortBy> thenByIsQrCodeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isQrCode', Sort.desc);
    });
  }

  QueryBuilder<CodeEntry, CodeEntry, QAfterSortBy> thenByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.asc);
    });
  }

  QueryBuilder<CodeEntry, CodeEntry, QAfterSortBy> thenByTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'timestamp', Sort.desc);
    });
  }
}

extension CodeEntryQueryWhereDistinct
    on QueryBuilder<CodeEntry, CodeEntry, QDistinct> {
  QueryBuilder<CodeEntry, CodeEntry, QDistinct> distinctByBarcodeData(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'barcodeData', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CodeEntry, CodeEntry, QDistinct> distinctByIsQrCode() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isQrCode');
    });
  }

  QueryBuilder<CodeEntry, CodeEntry, QDistinct> distinctByTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'timestamp');
    });
  }
}

extension CodeEntryQueryProperty
    on QueryBuilder<CodeEntry, CodeEntry, QQueryProperty> {
  QueryBuilder<CodeEntry, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CodeEntry, String, QQueryOperations> barcodeDataProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'barcodeData');
    });
  }

  QueryBuilder<CodeEntry, bool, QQueryOperations> isQrCodeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isQrCode');
    });
  }

  QueryBuilder<CodeEntry, DateTime, QQueryOperations> timestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'timestamp');
    });
  }
}
