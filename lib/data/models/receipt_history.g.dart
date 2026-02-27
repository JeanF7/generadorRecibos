// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_history.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetReceiptHistoryCollection on Isar {
  IsarCollection<ReceiptHistory> get receiptHistorys => this.collection();
}

const ReceiptHistorySchema = CollectionSchema(
  name: r'ReceiptHistory',
  id: 5398660106029248491,
  properties: {
    r'date': PropertySchema(
      id: 0,
      name: r'date',
      type: IsarType.dateTime,
    ),
    r'issuerProfileName': PropertySchema(
      id: 1,
      name: r'issuerProfileName',
      type: IsarType.string,
    ),
    r'items': PropertySchema(
      id: 2,
      name: r'items',
      type: IsarType.objectList,
      target: r'ReceiptItem',
    ),
    r'payerIdentifier': PropertySchema(
      id: 3,
      name: r'payerIdentifier',
      type: IsarType.string,
    ),
    r'payerName': PropertySchema(
      id: 4,
      name: r'payerName',
      type: IsarType.string,
    ),
    r'pdfPath': PropertySchema(
      id: 5,
      name: r'pdfPath',
      type: IsarType.string,
    ),
    r'receiptNumber': PropertySchema(
      id: 6,
      name: r'receiptNumber',
      type: IsarType.string,
    ),
    r'totalAmount': PropertySchema(
      id: 7,
      name: r'totalAmount',
      type: IsarType.double,
    )
  },
  estimateSize: _receiptHistoryEstimateSize,
  serialize: _receiptHistorySerialize,
  deserialize: _receiptHistoryDeserialize,
  deserializeProp: _receiptHistoryDeserializeProp,
  idName: r'id',
  indexes: {
    r'date': IndexSchema(
      id: -7552997827385218417,
      name: r'date',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'date',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'issuerProfileName': IndexSchema(
      id: 8862984709196294674,
      name: r'issuerProfileName',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'issuerProfileName',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {r'ReceiptItem': ReceiptItemSchema},
  getId: _receiptHistoryGetId,
  getLinks: _receiptHistoryGetLinks,
  attach: _receiptHistoryAttach,
  version: '3.1.0+1',
);

int _receiptHistoryEstimateSize(
  ReceiptHistory object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.issuerProfileName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final list = object.items;
    if (list != null) {
      bytesCount += 3 + list.length * 3;
      {
        final offsets = allOffsets[ReceiptItem]!;
        for (var i = 0; i < list.length; i++) {
          final value = list[i];
          bytesCount +=
              ReceiptItemSchema.estimateSize(value, offsets, allOffsets);
        }
      }
    }
  }
  {
    final value = object.payerIdentifier;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.payerName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.pdfPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.receiptNumber;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _receiptHistorySerialize(
  ReceiptHistory object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeDateTime(offsets[0], object.date);
  writer.writeString(offsets[1], object.issuerProfileName);
  writer.writeObjectList<ReceiptItem>(
    offsets[2],
    allOffsets,
    ReceiptItemSchema.serialize,
    object.items,
  );
  writer.writeString(offsets[3], object.payerIdentifier);
  writer.writeString(offsets[4], object.payerName);
  writer.writeString(offsets[5], object.pdfPath);
  writer.writeString(offsets[6], object.receiptNumber);
  writer.writeDouble(offsets[7], object.totalAmount);
}

ReceiptHistory _receiptHistoryDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = ReceiptHistory();
  object.date = reader.readDateTime(offsets[0]);
  object.id = id;
  object.issuerProfileName = reader.readStringOrNull(offsets[1]);
  object.items = reader.readObjectList<ReceiptItem>(
    offsets[2],
    ReceiptItemSchema.deserialize,
    allOffsets,
    ReceiptItem(),
  );
  object.payerIdentifier = reader.readStringOrNull(offsets[3]);
  object.payerName = reader.readStringOrNull(offsets[4]);
  object.pdfPath = reader.readStringOrNull(offsets[5]);
  object.receiptNumber = reader.readStringOrNull(offsets[6]);
  object.totalAmount = reader.readDoubleOrNull(offsets[7]);
  return object;
}

P _receiptHistoryDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readDateTime(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readObjectList<ReceiptItem>(
        offset,
        ReceiptItemSchema.deserialize,
        allOffsets,
        ReceiptItem(),
      )) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readDoubleOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _receiptHistoryGetId(ReceiptHistory object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _receiptHistoryGetLinks(ReceiptHistory object) {
  return [];
}

void _receiptHistoryAttach(
    IsarCollection<dynamic> col, Id id, ReceiptHistory object) {
  object.id = id;
}

extension ReceiptHistoryQueryWhereSort
    on QueryBuilder<ReceiptHistory, ReceiptHistory, QWhere> {
  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterWhere> anyDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'date'),
      );
    });
  }
}

extension ReceiptHistoryQueryWhere
    on QueryBuilder<ReceiptHistory, ReceiptHistory, QWhereClause> {
  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterWhereClause> idNotEqualTo(
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

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterWhereClause> idBetween(
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

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterWhereClause> dateEqualTo(
      DateTime date) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'date',
        value: [date],
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterWhereClause>
      dateNotEqualTo(DateTime date) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [],
              upper: [date],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [date],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [date],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'date',
              lower: [],
              upper: [date],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterWhereClause>
      dateGreaterThan(
    DateTime date, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [date],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterWhereClause> dateLessThan(
    DateTime date, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [],
        upper: [date],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterWhereClause> dateBetween(
    DateTime lowerDate,
    DateTime upperDate, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'date',
        lower: [lowerDate],
        includeLower: includeLower,
        upper: [upperDate],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterWhereClause>
      issuerProfileNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'issuerProfileName',
        value: [null],
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterWhereClause>
      issuerProfileNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'issuerProfileName',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterWhereClause>
      issuerProfileNameEqualTo(String? issuerProfileName) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'issuerProfileName',
        value: [issuerProfileName],
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterWhereClause>
      issuerProfileNameNotEqualTo(String? issuerProfileName) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'issuerProfileName',
              lower: [],
              upper: [issuerProfileName],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'issuerProfileName',
              lower: [issuerProfileName],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'issuerProfileName',
              lower: [issuerProfileName],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'issuerProfileName',
              lower: [],
              upper: [issuerProfileName],
              includeUpper: false,
            ));
      }
    });
  }
}

extension ReceiptHistoryQueryFilter
    on QueryBuilder<ReceiptHistory, ReceiptHistory, QFilterCondition> {
  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      dateEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      dateGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      dateLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'date',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      dateBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'date',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition> idBetween(
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

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      issuerProfileNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'issuerProfileName',
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      issuerProfileNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'issuerProfileName',
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      issuerProfileNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'issuerProfileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      issuerProfileNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'issuerProfileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      issuerProfileNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'issuerProfileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      issuerProfileNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'issuerProfileName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      issuerProfileNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'issuerProfileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      issuerProfileNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'issuerProfileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      issuerProfileNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'issuerProfileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      issuerProfileNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'issuerProfileName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      issuerProfileNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'issuerProfileName',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      issuerProfileNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'issuerProfileName',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      itemsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'items',
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      itemsIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'items',
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      itemsLengthEqualTo(int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      itemsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      itemsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      itemsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      itemsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      itemsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'items',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      payerIdentifierIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'payerIdentifier',
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      payerIdentifierIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'payerIdentifier',
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      payerIdentifierEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'payerIdentifier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      payerIdentifierGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'payerIdentifier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      payerIdentifierLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'payerIdentifier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      payerIdentifierBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'payerIdentifier',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      payerIdentifierStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'payerIdentifier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      payerIdentifierEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'payerIdentifier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      payerIdentifierContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'payerIdentifier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      payerIdentifierMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'payerIdentifier',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      payerIdentifierIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'payerIdentifier',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      payerIdentifierIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'payerIdentifier',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      payerNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'payerName',
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      payerNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'payerName',
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      payerNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'payerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      payerNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'payerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      payerNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'payerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      payerNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'payerName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      payerNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'payerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      payerNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'payerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      payerNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'payerName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      payerNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'payerName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      payerNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'payerName',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      payerNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'payerName',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      pdfPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'pdfPath',
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      pdfPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'pdfPath',
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      pdfPathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pdfPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      pdfPathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'pdfPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      pdfPathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'pdfPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      pdfPathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'pdfPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      pdfPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'pdfPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      pdfPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'pdfPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      pdfPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'pdfPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      pdfPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'pdfPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      pdfPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'pdfPath',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      pdfPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'pdfPath',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      receiptNumberIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'receiptNumber',
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      receiptNumberIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'receiptNumber',
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      receiptNumberEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'receiptNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      receiptNumberGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'receiptNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      receiptNumberLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'receiptNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      receiptNumberBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'receiptNumber',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      receiptNumberStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'receiptNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      receiptNumberEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'receiptNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      receiptNumberContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'receiptNumber',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      receiptNumberMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'receiptNumber',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      receiptNumberIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'receiptNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      receiptNumberIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'receiptNumber',
        value: '',
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      totalAmountIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'totalAmount',
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      totalAmountIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'totalAmount',
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      totalAmountEqualTo(
    double? value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      totalAmountGreaterThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      totalAmountLessThan(
    double? value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalAmount',
        value: value,
        epsilon: epsilon,
      ));
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      totalAmountBetween(
    double? lower,
    double? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalAmount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        epsilon: epsilon,
      ));
    });
  }
}

extension ReceiptHistoryQueryObject
    on QueryBuilder<ReceiptHistory, ReceiptHistory, QFilterCondition> {
  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterFilterCondition>
      itemsElement(FilterQuery<ReceiptItem> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'items');
    });
  }
}

extension ReceiptHistoryQueryLinks
    on QueryBuilder<ReceiptHistory, ReceiptHistory, QFilterCondition> {}

extension ReceiptHistoryQuerySortBy
    on QueryBuilder<ReceiptHistory, ReceiptHistory, QSortBy> {
  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterSortBy> sortByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterSortBy> sortByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterSortBy>
      sortByIssuerProfileName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issuerProfileName', Sort.asc);
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterSortBy>
      sortByIssuerProfileNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issuerProfileName', Sort.desc);
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterSortBy>
      sortByPayerIdentifier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payerIdentifier', Sort.asc);
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterSortBy>
      sortByPayerIdentifierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payerIdentifier', Sort.desc);
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterSortBy> sortByPayerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payerName', Sort.asc);
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterSortBy>
      sortByPayerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payerName', Sort.desc);
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterSortBy> sortByPdfPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdfPath', Sort.asc);
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterSortBy>
      sortByPdfPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdfPath', Sort.desc);
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterSortBy>
      sortByReceiptNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiptNumber', Sort.asc);
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterSortBy>
      sortByReceiptNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiptNumber', Sort.desc);
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterSortBy>
      sortByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.asc);
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterSortBy>
      sortByTotalAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.desc);
    });
  }
}

extension ReceiptHistoryQuerySortThenBy
    on QueryBuilder<ReceiptHistory, ReceiptHistory, QSortThenBy> {
  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterSortBy> thenByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.asc);
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterSortBy> thenByDateDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'date', Sort.desc);
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterSortBy>
      thenByIssuerProfileName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issuerProfileName', Sort.asc);
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterSortBy>
      thenByIssuerProfileNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'issuerProfileName', Sort.desc);
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterSortBy>
      thenByPayerIdentifier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payerIdentifier', Sort.asc);
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterSortBy>
      thenByPayerIdentifierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payerIdentifier', Sort.desc);
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterSortBy> thenByPayerName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payerName', Sort.asc);
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterSortBy>
      thenByPayerNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'payerName', Sort.desc);
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterSortBy> thenByPdfPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdfPath', Sort.asc);
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterSortBy>
      thenByPdfPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'pdfPath', Sort.desc);
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterSortBy>
      thenByReceiptNumber() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiptNumber', Sort.asc);
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterSortBy>
      thenByReceiptNumberDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'receiptNumber', Sort.desc);
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterSortBy>
      thenByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.asc);
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QAfterSortBy>
      thenByTotalAmountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalAmount', Sort.desc);
    });
  }
}

extension ReceiptHistoryQueryWhereDistinct
    on QueryBuilder<ReceiptHistory, ReceiptHistory, QDistinct> {
  QueryBuilder<ReceiptHistory, ReceiptHistory, QDistinct> distinctByDate() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'date');
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QDistinct>
      distinctByIssuerProfileName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'issuerProfileName',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QDistinct>
      distinctByPayerIdentifier({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'payerIdentifier',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QDistinct> distinctByPayerName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'payerName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QDistinct> distinctByPdfPath(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'pdfPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QDistinct>
      distinctByReceiptNumber({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'receiptNumber',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<ReceiptHistory, ReceiptHistory, QDistinct>
      distinctByTotalAmount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalAmount');
    });
  }
}

extension ReceiptHistoryQueryProperty
    on QueryBuilder<ReceiptHistory, ReceiptHistory, QQueryProperty> {
  QueryBuilder<ReceiptHistory, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<ReceiptHistory, DateTime, QQueryOperations> dateProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'date');
    });
  }

  QueryBuilder<ReceiptHistory, String?, QQueryOperations>
      issuerProfileNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'issuerProfileName');
    });
  }

  QueryBuilder<ReceiptHistory, List<ReceiptItem>?, QQueryOperations>
      itemsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'items');
    });
  }

  QueryBuilder<ReceiptHistory, String?, QQueryOperations>
      payerIdentifierProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'payerIdentifier');
    });
  }

  QueryBuilder<ReceiptHistory, String?, QQueryOperations> payerNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'payerName');
    });
  }

  QueryBuilder<ReceiptHistory, String?, QQueryOperations> pdfPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'pdfPath');
    });
  }

  QueryBuilder<ReceiptHistory, String?, QQueryOperations>
      receiptNumberProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'receiptNumber');
    });
  }

  QueryBuilder<ReceiptHistory, double?, QQueryOperations>
      totalAmountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalAmount');
    });
  }
}
