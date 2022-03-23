import 'package:examenfinalmovil/api/peticiones_api.dart';
import 'package:examenfinalmovil/models/ricky_model.dart';
import 'package:get/get.dart';

class RickyController extends GetxController{
  final peticionesApi = Get.find<PeticionesApi>();
  final List<RickyModel> ricky = [];

  Future<void> obtenerCharacter() async {
    final response = await peticionesApi.httpGet();
    final listaCharacter = response.body['character'];
    final listaCharacterModel = List<RickyModel>.from(
      listaCharacter.map((character) => RickyModel.fromJsonMap(character)));
      ricky.addAll(listaCharacter);
      update();
  }
}