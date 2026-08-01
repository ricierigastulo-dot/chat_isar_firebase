// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_file_entity.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMediaFileEntityCollection on Isar {
  IsarCollection<MediaFileEntity> get mediaFileEntitys => this.collection();
}

const MediaFileEntitySchema = CollectionSchema(
  name: r'MediaFileEntity',
  id: 2590322350842057062,
  properties: {
    r'estadoSincronizacion': PropertySchema(
      id: 0,
      name: r'estadoSincronizacion',
      type: IsarType.long,
    ),
    r'fechaCaptura': PropertySchema(
      id: 1,
      name: r'fechaCaptura',
      type: IsarType.dateTime,
    ),
    r'hashUnico': PropertySchema(
      id: 2,
      name: r'hashUnico',
      type: IsarType.string,
    ),
    r'mediaUrl': PropertySchema(
      id: 3,
      name: r'mediaUrl',
      type: IsarType.string,
    ),
    r'nombreArchivo': PropertySchema(
      id: 4,
      name: r'nombreArchivo',
      type: IsarType.string,
    ),
    r'rutaAbsoluta': PropertySchema(
      id: 5,
      name: r'rutaAbsoluta',
      type: IsarType.string,
    ),
    r'tamanoBytes': PropertySchema(
      id: 6,
      name: r'tamanoBytes',
      type: IsarType.long,
    ),
    r'tipoMultimedia': PropertySchema(
      id: 7,
      name: r'tipoMultimedia',
      type: IsarType.string,
    ),
    r'ultimaModificacionDispositivo': PropertySchema(
      id: 8,
      name: r'ultimaModificacionDispositivo',
      type: IsarType.dateTime,
    )
  },
  estimateSize: _mediaFileEntityEstimateSize,
  serialize: _mediaFileEntitySerialize,
  deserialize: _mediaFileEntityDeserialize,
  deserializeProp: _mediaFileEntityDeserializeProp,
  idName: r'id',
  indexes: {
    r'rutaAbsoluta': IndexSchema(
      id: 7306828953291205150,
      name: r'rutaAbsoluta',
      unique: true,
      replace: true,
      properties: [
        IndexPropertySchema(
          name: r'rutaAbsoluta',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'hashUnico': IndexSchema(
      id: 4252831171307073857,
      name: r'hashUnico',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'hashUnico',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    ),
    r'tamanoBytes': IndexSchema(
      id: -7456619145373856024,
      name: r'tamanoBytes',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'tamanoBytes',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'fechaCaptura': IndexSchema(
      id: -2104354798480900231,
      name: r'fechaCaptura',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'fechaCaptura',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    ),
    r'estadoSincronizacion': IndexSchema(
      id: -8847689344803606111,
      name: r'estadoSincronizacion',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'estadoSincronizacion',
          type: IndexType.value,
          caseSensitive: false,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _mediaFileEntityGetId,
  getLinks: _mediaFileEntityGetLinks,
  attach: _mediaFileEntityAttach,
  version: '3.1.0+1',
);

int _mediaFileEntityEstimateSize(
  MediaFileEntity object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  {
    final value = object.hashUnico;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.mediaUrl;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.nombreArchivo;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.rutaAbsoluta;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  {
    final value = object.tipoMultimedia;
    if (value != null) {
      bytesCount += 3 + value.length * 3;
    }
  }
  return bytesCount;
}

void _mediaFileEntitySerialize(
  MediaFileEntity object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeLong(offsets[0], object.estadoSincronizacion);
  writer.writeDateTime(offsets[1], object.fechaCaptura);
  writer.writeString(offsets[2], object.hashUnico);
  writer.writeString(offsets[3], object.mediaUrl);
  writer.writeString(offsets[4], object.nombreArchivo);
  writer.writeString(offsets[5], object.rutaAbsoluta);
  writer.writeLong(offsets[6], object.tamanoBytes);
  writer.writeString(offsets[7], object.tipoMultimedia);
  writer.writeDateTime(offsets[8], object.ultimaModificacionDispositivo);
}

MediaFileEntity _mediaFileEntityDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = MediaFileEntity();
  object.estadoSincronizacion = reader.readLong(offsets[0]);
  object.fechaCaptura = reader.readDateTimeOrNull(offsets[1]);
  object.hashUnico = reader.readStringOrNull(offsets[2]);
  object.id = id;
  object.mediaUrl = reader.readStringOrNull(offsets[3]);
  object.nombreArchivo = reader.readStringOrNull(offsets[4]);
  object.rutaAbsoluta = reader.readStringOrNull(offsets[5]);
  object.tamanoBytes = reader.readLongOrNull(offsets[6]);
  object.tipoMultimedia = reader.readStringOrNull(offsets[7]);
  object.ultimaModificacionDispositivo = reader.readDateTimeOrNull(offsets[8]);
  return object;
}

P _mediaFileEntityDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readDateTimeOrNull(offset)) as P;
    case 2:
      return (reader.readStringOrNull(offset)) as P;
    case 3:
      return (reader.readStringOrNull(offset)) as P;
    case 4:
      return (reader.readStringOrNull(offset)) as P;
    case 5:
      return (reader.readStringOrNull(offset)) as P;
    case 6:
      return (reader.readLongOrNull(offset)) as P;
    case 7:
      return (reader.readStringOrNull(offset)) as P;
    case 8:
      return (reader.readDateTimeOrNull(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _mediaFileEntityGetId(MediaFileEntity object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _mediaFileEntityGetLinks(MediaFileEntity object) {
  return [];
}

void _mediaFileEntityAttach(
    IsarCollection<dynamic> col, Id id, MediaFileEntity object) {
  object.id = id;
}

extension MediaFileEntityByIndex on IsarCollection<MediaFileEntity> {
  Future<MediaFileEntity?> getByRutaAbsoluta(String? rutaAbsoluta) {
    return getByIndex(r'rutaAbsoluta', [rutaAbsoluta]);
  }

  MediaFileEntity? getByRutaAbsolutaSync(String? rutaAbsoluta) {
    return getByIndexSync(r'rutaAbsoluta', [rutaAbsoluta]);
  }

  Future<bool> deleteByRutaAbsoluta(String? rutaAbsoluta) {
    return deleteByIndex(r'rutaAbsoluta', [rutaAbsoluta]);
  }

  bool deleteByRutaAbsolutaSync(String? rutaAbsoluta) {
    return deleteByIndexSync(r'rutaAbsoluta', [rutaAbsoluta]);
  }

  Future<List<MediaFileEntity?>> getAllByRutaAbsoluta(
      List<String?> rutaAbsolutaValues) {
    final values = rutaAbsolutaValues.map((e) => [e]).toList();
    return getAllByIndex(r'rutaAbsoluta', values);
  }

  List<MediaFileEntity?> getAllByRutaAbsolutaSync(
      List<String?> rutaAbsolutaValues) {
    final values = rutaAbsolutaValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'rutaAbsoluta', values);
  }

  Future<int> deleteAllByRutaAbsoluta(List<String?> rutaAbsolutaValues) {
    final values = rutaAbsolutaValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'rutaAbsoluta', values);
  }

  int deleteAllByRutaAbsolutaSync(List<String?> rutaAbsolutaValues) {
    final values = rutaAbsolutaValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'rutaAbsoluta', values);
  }

  Future<Id> putByRutaAbsoluta(MediaFileEntity object) {
    return putByIndex(r'rutaAbsoluta', object);
  }

  Id putByRutaAbsolutaSync(MediaFileEntity object, {bool saveLinks = true}) {
    return putByIndexSync(r'rutaAbsoluta', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByRutaAbsoluta(List<MediaFileEntity> objects) {
    return putAllByIndex(r'rutaAbsoluta', objects);
  }

  List<Id> putAllByRutaAbsolutaSync(List<MediaFileEntity> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'rutaAbsoluta', objects, saveLinks: saveLinks);
  }
}

extension MediaFileEntityQueryWhereSort
    on QueryBuilder<MediaFileEntity, MediaFileEntity, QWhere> {
  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterWhere> anyTamanoBytes() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'tamanoBytes'),
      );
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterWhere>
      anyFechaCaptura() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'fechaCaptura'),
      );
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterWhere>
      anyEstadoSincronizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        const IndexWhereClause.any(indexName: r'estadoSincronizacion'),
      );
    });
  }
}

extension MediaFileEntityQueryWhere
    on QueryBuilder<MediaFileEntity, MediaFileEntity, QWhereClause> {
  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterWhereClause> idEqualTo(
      Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterWhereClause>
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

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterWhereClause> idLessThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterWhereClause> idBetween(
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

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterWhereClause>
      rutaAbsolutaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'rutaAbsoluta',
        value: [null],
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterWhereClause>
      rutaAbsolutaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'rutaAbsoluta',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterWhereClause>
      rutaAbsolutaEqualTo(String? rutaAbsoluta) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'rutaAbsoluta',
        value: [rutaAbsoluta],
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterWhereClause>
      rutaAbsolutaNotEqualTo(String? rutaAbsoluta) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rutaAbsoluta',
              lower: [],
              upper: [rutaAbsoluta],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rutaAbsoluta',
              lower: [rutaAbsoluta],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rutaAbsoluta',
              lower: [rutaAbsoluta],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'rutaAbsoluta',
              lower: [],
              upper: [rutaAbsoluta],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterWhereClause>
      hashUnicoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'hashUnico',
        value: [null],
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterWhereClause>
      hashUnicoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'hashUnico',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterWhereClause>
      hashUnicoEqualTo(String? hashUnico) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'hashUnico',
        value: [hashUnico],
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterWhereClause>
      hashUnicoNotEqualTo(String? hashUnico) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'hashUnico',
              lower: [],
              upper: [hashUnico],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'hashUnico',
              lower: [hashUnico],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'hashUnico',
              lower: [hashUnico],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'hashUnico',
              lower: [],
              upper: [hashUnico],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterWhereClause>
      tamanoBytesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'tamanoBytes',
        value: [null],
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterWhereClause>
      tamanoBytesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'tamanoBytes',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterWhereClause>
      tamanoBytesEqualTo(int? tamanoBytes) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'tamanoBytes',
        value: [tamanoBytes],
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterWhereClause>
      tamanoBytesNotEqualTo(int? tamanoBytes) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tamanoBytes',
              lower: [],
              upper: [tamanoBytes],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tamanoBytes',
              lower: [tamanoBytes],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tamanoBytes',
              lower: [tamanoBytes],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'tamanoBytes',
              lower: [],
              upper: [tamanoBytes],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterWhereClause>
      tamanoBytesGreaterThan(
    int? tamanoBytes, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'tamanoBytes',
        lower: [tamanoBytes],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterWhereClause>
      tamanoBytesLessThan(
    int? tamanoBytes, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'tamanoBytes',
        lower: [],
        upper: [tamanoBytes],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterWhereClause>
      tamanoBytesBetween(
    int? lowerTamanoBytes,
    int? upperTamanoBytes, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'tamanoBytes',
        lower: [lowerTamanoBytes],
        includeLower: includeLower,
        upper: [upperTamanoBytes],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterWhereClause>
      fechaCapturaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'fechaCaptura',
        value: [null],
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterWhereClause>
      fechaCapturaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'fechaCaptura',
        lower: [null],
        includeLower: false,
        upper: [],
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterWhereClause>
      fechaCapturaEqualTo(DateTime? fechaCaptura) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'fechaCaptura',
        value: [fechaCaptura],
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterWhereClause>
      fechaCapturaNotEqualTo(DateTime? fechaCaptura) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fechaCaptura',
              lower: [],
              upper: [fechaCaptura],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fechaCaptura',
              lower: [fechaCaptura],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fechaCaptura',
              lower: [fechaCaptura],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'fechaCaptura',
              lower: [],
              upper: [fechaCaptura],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterWhereClause>
      fechaCapturaGreaterThan(
    DateTime? fechaCaptura, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'fechaCaptura',
        lower: [fechaCaptura],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterWhereClause>
      fechaCapturaLessThan(
    DateTime? fechaCaptura, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'fechaCaptura',
        lower: [],
        upper: [fechaCaptura],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterWhereClause>
      fechaCapturaBetween(
    DateTime? lowerFechaCaptura,
    DateTime? upperFechaCaptura, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'fechaCaptura',
        lower: [lowerFechaCaptura],
        includeLower: includeLower,
        upper: [upperFechaCaptura],
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterWhereClause>
      estadoSincronizacionEqualTo(int estadoSincronizacion) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'estadoSincronizacion',
        value: [estadoSincronizacion],
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterWhereClause>
      estadoSincronizacionNotEqualTo(int estadoSincronizacion) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'estadoSincronizacion',
              lower: [],
              upper: [estadoSincronizacion],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'estadoSincronizacion',
              lower: [estadoSincronizacion],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'estadoSincronizacion',
              lower: [estadoSincronizacion],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'estadoSincronizacion',
              lower: [],
              upper: [estadoSincronizacion],
              includeUpper: false,
            ));
      }
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterWhereClause>
      estadoSincronizacionGreaterThan(
    int estadoSincronizacion, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'estadoSincronizacion',
        lower: [estadoSincronizacion],
        includeLower: include,
        upper: [],
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterWhereClause>
      estadoSincronizacionLessThan(
    int estadoSincronizacion, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'estadoSincronizacion',
        lower: [],
        upper: [estadoSincronizacion],
        includeUpper: include,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterWhereClause>
      estadoSincronizacionBetween(
    int lowerEstadoSincronizacion,
    int upperEstadoSincronizacion, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.between(
        indexName: r'estadoSincronizacion',
        lower: [lowerEstadoSincronizacion],
        includeLower: includeLower,
        upper: [upperEstadoSincronizacion],
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MediaFileEntityQueryFilter
    on QueryBuilder<MediaFileEntity, MediaFileEntity, QFilterCondition> {
  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      estadoSincronizacionEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'estadoSincronizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      estadoSincronizacionGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'estadoSincronizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      estadoSincronizacionLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'estadoSincronizacion',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      estadoSincronizacionBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'estadoSincronizacion',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      fechaCapturaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'fechaCaptura',
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      fechaCapturaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'fechaCaptura',
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      fechaCapturaEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'fechaCaptura',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      fechaCapturaGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'fechaCaptura',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      fechaCapturaLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'fechaCaptura',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      fechaCapturaBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'fechaCaptura',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      hashUnicoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'hashUnico',
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      hashUnicoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'hashUnico',
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      hashUnicoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashUnico',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      hashUnicoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'hashUnico',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      hashUnicoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'hashUnico',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      hashUnicoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'hashUnico',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      hashUnicoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'hashUnico',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      hashUnicoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'hashUnico',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      hashUnicoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'hashUnico',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      hashUnicoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'hashUnico',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      hashUnicoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'hashUnico',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      hashUnicoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'hashUnico',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
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

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
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

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
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

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      mediaUrlIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'mediaUrl',
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      mediaUrlIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'mediaUrl',
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      mediaUrlEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mediaUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      mediaUrlGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'mediaUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      mediaUrlLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'mediaUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      mediaUrlBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'mediaUrl',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      mediaUrlStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'mediaUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      mediaUrlEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'mediaUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      mediaUrlContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'mediaUrl',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      mediaUrlMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'mediaUrl',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      mediaUrlIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'mediaUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      mediaUrlIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'mediaUrl',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      nombreArchivoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'nombreArchivo',
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      nombreArchivoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'nombreArchivo',
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      nombreArchivoEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombreArchivo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      nombreArchivoGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'nombreArchivo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      nombreArchivoLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'nombreArchivo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      nombreArchivoBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'nombreArchivo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      nombreArchivoStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'nombreArchivo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      nombreArchivoEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'nombreArchivo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      nombreArchivoContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'nombreArchivo',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      nombreArchivoMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'nombreArchivo',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      nombreArchivoIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'nombreArchivo',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      nombreArchivoIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'nombreArchivo',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      rutaAbsolutaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'rutaAbsoluta',
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      rutaAbsolutaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'rutaAbsoluta',
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      rutaAbsolutaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rutaAbsoluta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      rutaAbsolutaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'rutaAbsoluta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      rutaAbsolutaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'rutaAbsoluta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      rutaAbsolutaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'rutaAbsoluta',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      rutaAbsolutaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'rutaAbsoluta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      rutaAbsolutaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'rutaAbsoluta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      rutaAbsolutaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'rutaAbsoluta',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      rutaAbsolutaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'rutaAbsoluta',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      rutaAbsolutaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'rutaAbsoluta',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      rutaAbsolutaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'rutaAbsoluta',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      tamanoBytesIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tamanoBytes',
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      tamanoBytesIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tamanoBytes',
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      tamanoBytesEqualTo(int? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tamanoBytes',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      tamanoBytesGreaterThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tamanoBytes',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      tamanoBytesLessThan(
    int? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tamanoBytes',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      tamanoBytesBetween(
    int? lower,
    int? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tamanoBytes',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      tipoMultimediaIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'tipoMultimedia',
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      tipoMultimediaIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'tipoMultimedia',
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      tipoMultimediaEqualTo(
    String? value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipoMultimedia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      tipoMultimediaGreaterThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'tipoMultimedia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      tipoMultimediaLessThan(
    String? value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'tipoMultimedia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      tipoMultimediaBetween(
    String? lower,
    String? upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'tipoMultimedia',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      tipoMultimediaStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'tipoMultimedia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      tipoMultimediaEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'tipoMultimedia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      tipoMultimediaContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'tipoMultimedia',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      tipoMultimediaMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'tipoMultimedia',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      tipoMultimediaIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'tipoMultimedia',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      tipoMultimediaIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'tipoMultimedia',
        value: '',
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      ultimaModificacionDispositivoIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNull(
        property: r'ultimaModificacionDispositivo',
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      ultimaModificacionDispositivoIsNotNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const FilterCondition.isNotNull(
        property: r'ultimaModificacionDispositivo',
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      ultimaModificacionDispositivoEqualTo(DateTime? value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'ultimaModificacionDispositivo',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      ultimaModificacionDispositivoGreaterThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'ultimaModificacionDispositivo',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      ultimaModificacionDispositivoLessThan(
    DateTime? value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'ultimaModificacionDispositivo',
        value: value,
      ));
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterFilterCondition>
      ultimaModificacionDispositivoBetween(
    DateTime? lower,
    DateTime? upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'ultimaModificacionDispositivo',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MediaFileEntityQueryObject
    on QueryBuilder<MediaFileEntity, MediaFileEntity, QFilterCondition> {}

extension MediaFileEntityQueryLinks
    on QueryBuilder<MediaFileEntity, MediaFileEntity, QFilterCondition> {}

extension MediaFileEntityQuerySortBy
    on QueryBuilder<MediaFileEntity, MediaFileEntity, QSortBy> {
  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterSortBy>
      sortByEstadoSincronizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoSincronizacion', Sort.asc);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterSortBy>
      sortByEstadoSincronizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoSincronizacion', Sort.desc);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterSortBy>
      sortByFechaCaptura() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCaptura', Sort.asc);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterSortBy>
      sortByFechaCapturaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCaptura', Sort.desc);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterSortBy>
      sortByHashUnico() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashUnico', Sort.asc);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterSortBy>
      sortByHashUnicoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashUnico', Sort.desc);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterSortBy>
      sortByMediaUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mediaUrl', Sort.asc);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterSortBy>
      sortByMediaUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mediaUrl', Sort.desc);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterSortBy>
      sortByNombreArchivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreArchivo', Sort.asc);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterSortBy>
      sortByNombreArchivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreArchivo', Sort.desc);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterSortBy>
      sortByRutaAbsoluta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rutaAbsoluta', Sort.asc);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterSortBy>
      sortByRutaAbsolutaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rutaAbsoluta', Sort.desc);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterSortBy>
      sortByTamanoBytes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tamanoBytes', Sort.asc);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterSortBy>
      sortByTamanoBytesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tamanoBytes', Sort.desc);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterSortBy>
      sortByTipoMultimedia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoMultimedia', Sort.asc);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterSortBy>
      sortByTipoMultimediaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoMultimedia', Sort.desc);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterSortBy>
      sortByUltimaModificacionDispositivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ultimaModificacionDispositivo', Sort.asc);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterSortBy>
      sortByUltimaModificacionDispositivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ultimaModificacionDispositivo', Sort.desc);
    });
  }
}

extension MediaFileEntityQuerySortThenBy
    on QueryBuilder<MediaFileEntity, MediaFileEntity, QSortThenBy> {
  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterSortBy>
      thenByEstadoSincronizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoSincronizacion', Sort.asc);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterSortBy>
      thenByEstadoSincronizacionDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'estadoSincronizacion', Sort.desc);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterSortBy>
      thenByFechaCaptura() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCaptura', Sort.asc);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterSortBy>
      thenByFechaCapturaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'fechaCaptura', Sort.desc);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterSortBy>
      thenByHashUnico() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashUnico', Sort.asc);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterSortBy>
      thenByHashUnicoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'hashUnico', Sort.desc);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterSortBy>
      thenByMediaUrl() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mediaUrl', Sort.asc);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterSortBy>
      thenByMediaUrlDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'mediaUrl', Sort.desc);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterSortBy>
      thenByNombreArchivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreArchivo', Sort.asc);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterSortBy>
      thenByNombreArchivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'nombreArchivo', Sort.desc);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterSortBy>
      thenByRutaAbsoluta() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rutaAbsoluta', Sort.asc);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterSortBy>
      thenByRutaAbsolutaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'rutaAbsoluta', Sort.desc);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterSortBy>
      thenByTamanoBytes() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tamanoBytes', Sort.asc);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterSortBy>
      thenByTamanoBytesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tamanoBytes', Sort.desc);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterSortBy>
      thenByTipoMultimedia() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoMultimedia', Sort.asc);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterSortBy>
      thenByTipoMultimediaDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'tipoMultimedia', Sort.desc);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterSortBy>
      thenByUltimaModificacionDispositivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ultimaModificacionDispositivo', Sort.asc);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QAfterSortBy>
      thenByUltimaModificacionDispositivoDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ultimaModificacionDispositivo', Sort.desc);
    });
  }
}

extension MediaFileEntityQueryWhereDistinct
    on QueryBuilder<MediaFileEntity, MediaFileEntity, QDistinct> {
  QueryBuilder<MediaFileEntity, MediaFileEntity, QDistinct>
      distinctByEstadoSincronizacion() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'estadoSincronizacion');
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QDistinct>
      distinctByFechaCaptura() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'fechaCaptura');
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QDistinct> distinctByHashUnico(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'hashUnico', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QDistinct> distinctByMediaUrl(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'mediaUrl', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QDistinct>
      distinctByNombreArchivo({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'nombreArchivo',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QDistinct>
      distinctByRutaAbsoluta({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'rutaAbsoluta', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QDistinct>
      distinctByTamanoBytes() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tamanoBytes');
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QDistinct>
      distinctByTipoMultimedia({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'tipoMultimedia',
          caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<MediaFileEntity, MediaFileEntity, QDistinct>
      distinctByUltimaModificacionDispositivo() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ultimaModificacionDispositivo');
    });
  }
}

extension MediaFileEntityQueryProperty
    on QueryBuilder<MediaFileEntity, MediaFileEntity, QQueryProperty> {
  QueryBuilder<MediaFileEntity, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<MediaFileEntity, int, QQueryOperations>
      estadoSincronizacionProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'estadoSincronizacion');
    });
  }

  QueryBuilder<MediaFileEntity, DateTime?, QQueryOperations>
      fechaCapturaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'fechaCaptura');
    });
  }

  QueryBuilder<MediaFileEntity, String?, QQueryOperations> hashUnicoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'hashUnico');
    });
  }

  QueryBuilder<MediaFileEntity, String?, QQueryOperations> mediaUrlProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'mediaUrl');
    });
  }

  QueryBuilder<MediaFileEntity, String?, QQueryOperations>
      nombreArchivoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'nombreArchivo');
    });
  }

  QueryBuilder<MediaFileEntity, String?, QQueryOperations>
      rutaAbsolutaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'rutaAbsoluta');
    });
  }

  QueryBuilder<MediaFileEntity, int?, QQueryOperations> tamanoBytesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tamanoBytes');
    });
  }

  QueryBuilder<MediaFileEntity, String?, QQueryOperations>
      tipoMultimediaProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'tipoMultimedia');
    });
  }

  QueryBuilder<MediaFileEntity, DateTime?, QQueryOperations>
      ultimaModificacionDispositivoProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ultimaModificacionDispositivo');
    });
  }
}
