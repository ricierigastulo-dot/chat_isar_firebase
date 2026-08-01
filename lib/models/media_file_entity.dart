import 'package:isar/isar.dart';

part 'media_file_entity.g.dart';

@collection
class MediaFileEntity {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? rutaAbsoluta;

  @Index()
  String? hashUnico;

  String? nombreArchivo;

  @Index()
  int? tamanoBytes;

  String? tipoMultimedia; // 'foto' o 'video'

  @Index()
  DateTime? fechaCaptura;

  @Index()
  int estadoSincronizacion = 0; // 0=Pendiente, 1=Sincronizado, 2=Marcado borrado, 3=Eliminado

  DateTime? ultimaModificacionDispositivo;

  // 🔗 Campo nuevo para guardar la URL devuelta por Firebase Storage
  String? mediaUrl;
}
