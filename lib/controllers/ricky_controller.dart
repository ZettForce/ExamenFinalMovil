import 'package:examenfinalmovil/api/peticiones_api.dart';
import 'package:examenfinalmovil/models/ricky_model.dart';
import 'package:get/get.dart';

class RickyController extends GetxController{

@override
  void onInit() {
    obtenerCharacter();
    super.onInit();
  }
  final peticionesApi = Get.find<PeticionesApi>();
  bool cargando = false;
  List<RickyModel>personajes = [];
  List<RickyModel> personajeSearch =[];
  late RickyModel charecter;

// Obtener todos los personajes
  Future<void> obtenerCharacter() async {
    cargando = true;
    update();
    final response = await peticionesApi.httpGet(url: 'https://rickandmortyapi.com/api/character');
    final listaPersonajes = response.body['results'];
    final listaPersonajesModel = List<RickyModel>.from(
      listaPersonajes.map((character) => RickyModel.fromJsonMap(character)));
      personajes.addAll(listaPersonajesModel);
      cargando = false;
      update();
  }
  //buscar 1 solo personaje con el search
  Future buscarPersonajes( String query) async{
    final response = await peticionesApi.httpGet(url: 'https://rickandmortyapi.com/api/character', query: {'name' :query});

    final listaPersonajes = response.body['results'];
    final listaPersonajesModel = List<RickyModel>.from(
      listaPersonajes.map((charecter) => RickyModel.fromJsonMap(charecter),
      ),
    );

    personajeSearch = listaPersonajesModel;
    update();
  }
}