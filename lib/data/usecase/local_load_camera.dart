import 'package:camera/camera.dart';

class LocalLoadCamera {
  Future<List<CameraDescription>> load() async {
    try {
      return await availableCameras();
    } on CameraException catch (e) {
      throw Exception(
          "Erro ao usar a câmera: código ${e.code}, decrição ${e.description}");
    } catch (e) {
      throw Exception("Erro inesperado: $e");
    }
  }
}
