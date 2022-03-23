import 'package:get/get.dart';
class PeticionesApi extends GetConnect{
  Future<Response> httpGet() async{
    final response = await get('https://rickandmortyapi.com/api/character');
    return response;
  }
}