// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'organization_config.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetOrganizationConfigCollection on Isar {
  IsarCollection<OrganizationConfig> get organizationConfigs =>
      this.collection();
}

const OrganizationConfigSchema = CollectionSchema(
  name: r'OrganizationConfig',
  id: -789752498665899590,
  properties: {
    r'additionalInfo': PropertySchema(
      id: 0,
      name: r'additionalInfo',
      type: IsarType.string,
    ),
    r'address': PropertySchema(
      id: 1,
      name: r'address',
      type: IsarType.string,
    ),
    r'email': PropertySchema(
      id: 2,
      name: r'email',
      type: IsarType.string,
    ),
    r'isInstitution': PropertySchema(
      id: 3,
      name: r'isInstitution',
      type: IsarType.bool,
    ),
    r'logoPath': PropertySchema(
      id: 4,
      name: r'logoPath',
      type: IsarType.string,
    ),
    r'name': PropertySchema(
      id: 5,
      name: r'name',
      type: IsarType.string,
    ),
    r'phone': PropertySchema(
      id: 6,
      name: r'phone',
      type: IsarType.string,
    ),
    r'profileName': PropertySchema(
      id: 7,
      name: r'profileName',
      type: IsarType.string,
    ),
    r'signaturePath': PropertySchema(
      id: 8,
      name: r'signaturePath',
      type: IsarType.string,
    ),
    r'stampPath': PropertySchema(
      id: 9,
      name: r'stampPath',
      type: IsarType.string,
    ),
    r'taxId': PropertySchema(
      id: 10,
      name: r'taxId',
      type: IsarType.string,
    )
  },
  estimateSize: _organizationConfigEstimateSize,
  serialize: _organizationConfigSerialize,
  deserialize: _organizationConfigDeserialize,
  deserializeProp: _organizationConfigDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _organizationConfigGetId,
  getLinks: _organizationConfigGetLinks,
  attach: _organizationConfigAttach,
  version: '3.1.0+1',
);

int _organizationConfigEstimateSize(
  OrganizationConfig object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.additionalInfo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.address;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.email;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.logoPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.name;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.phone;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.profileName;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.signaturePath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.stampPath;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.taxId;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _organizationConfigSerialize(
  OrganizationConfig object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.additionalInfo);
  writer.writeString(offsets[1], object.address);
  writer.writeString(offsets[2], object.email);
  writer.writeBool(offsets[3], object.isInstitution);
  writer.writeString(offsets[4], object.logoPath);
  writer.writeString(offsets[5], object.name);
  writer.writeString(offsets[6], object.phone);
  writer.writeString(offsets[7], object.profileName);
  writer.writeString(offsets[8], object.signaturePath);
  writer.writeString(offsets[9], object.stampPath);
  writer.writeString(offsets[10], object.taxId);
}

OrganizationConfig _organizationConfigDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = OrganizationConfig();
  object.additionalInfo = reader.readStringOrNull(offsets[0]);
  object.address = reader.readStringOrNull(offsets[1]);
  object.email = reader.readStringOrNull(offsets[2]);
  object.id = id;
  object.isInstitution = reader.readBoolOrNull(offsets[3]);
  object.logoPath = reader.readStringOrNull(offsets[4]);
  object.name = reader.readStringOrNull(offsets[5]);
  object.phone = reader.readStringOrNull(offsets[6]);
  object.profileName = reader.readStringOrNull(offsets[7]);
  object.signaturePath = reader.readStringOrNull(offsets[8]);
  object.stampPath = reader.readStringOrNull(offsets[9]);
  object.taxId = reader.readStringOrNull(offsets[10]);
  return object;
}

P _organizationConfigDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readStringOrNull(offset)) as P;
    case 1:
      return (reader.readStringOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readBoolOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readStringOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readStringOrNull(offset)) as P;
    case 9:
      return (reader.readStringOrNull(offset)) as P;
    case 10:
      return (reader.readStringOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _organizationConfigGetId(OrganizationConfig object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _organizationConfigGetLinks(
    OrganizationConfig object) {
  return [];
}

void _organizationConfigAttach(
    IsarCollection<dynamic> col, Id id, OrganizationConfig object) {
  object.id = id;
}

extension OrganizationConfigQueryWhereSort
    on QueryBuilder<OrganizationConfig, OrganizationConfig, QWhere> {
  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension OrganizationConfigQueryWhere
    on QueryBuilder<OrganizationConfig, OrganizationConfig, QWhereClause> {
  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterWhereClause>
      idBetween(
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

extension OrganizationConfigQueryFilter
    on QueryBuilder<OrganizationConfig, OrganizationConfig, QFilterCondition> {
  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      additionalInfoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'additionalInfo',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      additionalInfoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'additionalInfo',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      additionalInfoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'additionalInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      additionalInfoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'additionalInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      additionalInfoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'additionalInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      additionalInfoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'additionalInfo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      additionalInfoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'additionalInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      additionalInfoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'additionalInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      additionalInfoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'additionalInfo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      additionalInfoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'additionalInfo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      additionalInfoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'additionalInfo',
        value: '',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      additionalInfoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'additionalInfo',
        value: '',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      addressIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'address',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      addressIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'address',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      addressEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      addressGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      addressLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      addressBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'address',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      addressStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      addressEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      addressContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'address',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      addressMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'address',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      addressIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      addressIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'address',
        value: '',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      emailIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      emailIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'email',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      emailEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      emailGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      emailLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      emailBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'email',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      emailStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      emailEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      emailContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'email',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      emailMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'email',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      emailIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      emailIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'email',
        value: '',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
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

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
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

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      isInstitutionIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'isInstitution',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      isInstitutionIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'isInstitution',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      isInstitutionEqualTo(bool? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isInstitution',
        value: value,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      logoPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'logoPath',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      logoPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'logoPath',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      logoPathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      logoPathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'logoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      logoPathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'logoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      logoPathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'logoPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      logoPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'logoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      logoPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'logoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      logoPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'logoPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      logoPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'logoPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      logoPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'logoPath',
        value: '',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      logoPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'logoPath',
        value: '',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      nameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      nameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'name',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      nameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      nameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      nameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      nameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'name',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      nameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'name',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      nameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'name',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      nameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      nameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'name',
        value: '',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      phoneIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'phone',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      phoneIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'phone',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      phoneEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      phoneGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      phoneLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      phoneBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'phone',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      phoneStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      phoneEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      phoneContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'phone',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      phoneMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'phone',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      phoneIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      phoneIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'phone',
        value: '',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      profileNameIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'profileName',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      profileNameIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'profileName',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      profileNameEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'profileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      profileNameGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'profileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      profileNameLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'profileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      profileNameBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'profileName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      profileNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'profileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      profileNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'profileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      profileNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'profileName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      profileNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'profileName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      profileNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'profileName',
        value: '',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      profileNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'profileName',
        value: '',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      signaturePathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'signaturePath',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      signaturePathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'signaturePath',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      signaturePathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'signaturePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      signaturePathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'signaturePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      signaturePathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'signaturePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      signaturePathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'signaturePath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      signaturePathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'signaturePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      signaturePathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'signaturePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      signaturePathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'signaturePath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      signaturePathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'signaturePath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      signaturePathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'signaturePath',
        value: '',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      signaturePathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'signaturePath',
        value: '',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      stampPathIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'stampPath',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      stampPathIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'stampPath',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      stampPathEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stampPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      stampPathGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'stampPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      stampPathLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'stampPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      stampPathBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'stampPath',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      stampPathStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'stampPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      stampPathEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'stampPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      stampPathContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'stampPath',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      stampPathMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'stampPath',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      stampPathIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'stampPath',
        value: '',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      stampPathIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'stampPath',
        value: '',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      taxIdIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'taxId',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      taxIdIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'taxId',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      taxIdEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      taxIdGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'taxId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      taxIdLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'taxId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      taxIdBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'taxId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      taxIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'taxId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      taxIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'taxId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      taxIdContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'taxId',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      taxIdMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'taxId',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      taxIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'taxId',
        value: '',
      ));
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterFilterCondition>
      taxIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'taxId',
        value: '',
      ));
    });
  }
}

extension OrganizationConfigQueryObject
    on QueryBuilder<OrganizationConfig, OrganizationConfig, QFilterCondition> {}

extension OrganizationConfigQueryLinks
    on QueryBuilder<OrganizationConfig, OrganizationConfig, QFilterCondition> {}

extension OrganizationConfigQuerySortBy
    on QueryBuilder<OrganizationConfig, OrganizationConfig, QSortBy> {
  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      sortByAdditionalInfo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'additionalInfo', Sort.asc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      sortByAdditionalInfoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'additionalInfo', Sort.desc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      sortByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      sortByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      sortByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      sortByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      sortByIsInstitution() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInstitution', Sort.asc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      sortByIsInstitutionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInstitution', Sort.desc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      sortByLogoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoPath', Sort.asc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      sortByLogoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoPath', Sort.desc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      sortByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      sortByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      sortByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      sortByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      sortByProfileName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileName', Sort.asc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      sortByProfileNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileName', Sort.desc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      sortBySignaturePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'signaturePath', Sort.asc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      sortBySignaturePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'signaturePath', Sort.desc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      sortByStampPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stampPath', Sort.asc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      sortByStampPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stampPath', Sort.desc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      sortByTaxId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxId', Sort.asc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      sortByTaxIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxId', Sort.desc);
    });
  }
}

extension OrganizationConfigQuerySortThenBy
    on QueryBuilder<OrganizationConfig, OrganizationConfig, QSortThenBy> {
  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      thenByAdditionalInfo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'additionalInfo', Sort.asc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      thenByAdditionalInfoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'additionalInfo', Sort.desc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      thenByAddress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.asc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      thenByAddressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'address', Sort.desc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      thenByEmail() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.asc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      thenByEmailDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'email', Sort.desc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      thenByIsInstitution() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInstitution', Sort.asc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      thenByIsInstitutionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isInstitution', Sort.desc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      thenByLogoPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoPath', Sort.asc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      thenByLogoPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'logoPath', Sort.desc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      thenByName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.asc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      thenByNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'name', Sort.desc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      thenByPhone() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.asc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      thenByPhoneDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'phone', Sort.desc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      thenByProfileName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileName', Sort.asc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      thenByProfileNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'profileName', Sort.desc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      thenBySignaturePath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'signaturePath', Sort.asc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      thenBySignaturePathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'signaturePath', Sort.desc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      thenByStampPath() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stampPath', Sort.asc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      thenByStampPathDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'stampPath', Sort.desc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      thenByTaxId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxId', Sort.asc);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QAfterSortBy>
      thenByTaxIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'taxId', Sort.desc);
    });
  }
}

extension OrganizationConfigQueryWhereDistinct
    on QueryBuilder<OrganizationConfig, OrganizationConfig, QDistinct> {
  QueryBuilder<OrganizationConfig, OrganizationConfig, QDistinct>
      distinctByAdditionalInfo({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'additionalInfo',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QDistinct>
      distinctByAddress({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'address', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QDistinct>
      distinctByEmail({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'email', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QDistinct>
      distinctByIsInstitution() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isInstitution');
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QDistinct>
      distinctByLogoPath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'logoPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QDistinct>
      distinctByName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'name', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QDistinct>
      distinctByPhone({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'phone', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QDistinct>
      distinctByProfileName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'profileName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QDistinct>
      distinctBySignaturePath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'signaturePath',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QDistinct>
      distinctByStampPath({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'stampPath', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<OrganizationConfig, OrganizationConfig, QDistinct>
      distinctByTaxId({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'taxId', caseSensitive: caseSensitive);
    });
  }
}

extension OrganizationConfigQueryProperty
    on QueryBuilder<OrganizationConfig, OrganizationConfig, QQueryProperty> {
  QueryBuilder<OrganizationConfig, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<OrganizationConfig, String?, QQueryOperations>
      additionalInfoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'additionalInfo');
    });
  }

  QueryBuilder<OrganizationConfig, String?, QQueryOperations>
      addressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'address');
    });
  }

  QueryBuilder<OrganizationConfig, String?, QQueryOperations> emailProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'email');
    });
  }

  QueryBuilder<OrganizationConfig, bool?, QQueryOperations>
      isInstitutionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isInstitution');
    });
  }

  QueryBuilder<OrganizationConfig, String?, QQueryOperations>
      logoPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'logoPath');
    });
  }

  QueryBuilder<OrganizationConfig, String?, QQueryOperations> nameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'name');
    });
  }

  QueryBuilder<OrganizationConfig, String?, QQueryOperations> phoneProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'phone');
    });
  }

  QueryBuilder<OrganizationConfig, String?, QQueryOperations>
      profileNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'profileName');
    });
  }

  QueryBuilder<OrganizationConfig, String?, QQueryOperations>
      signaturePathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'signaturePath');
    });
  }

  QueryBuilder<OrganizationConfig, String?, QQueryOperations>
      stampPathProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'stampPath');
    });
  }

  QueryBuilder<OrganizationConfig, String?, QQueryOperations> taxIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'taxId');
    });
  }
}
