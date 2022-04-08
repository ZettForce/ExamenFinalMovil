import 'package:examenfinalmovil/controllers/ricky_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPersonaje extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    // Widgets lado derecho appbar
    return [
      IconButton(
      onPressed: (){
        query='';
      },
       icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // Un solo widget de lado izquierdo de appbar
    return IconButton(
      onPressed: (){
        Navigator.pop(context);
      },
       icon: Icon(Icons.arrow_back_outlined));
  }

  @override
  Widget buildResults(BuildContext context) {
  
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    Get.find<RickyController>().buscarPersonajes(query);
   
    return GetBuilder<RickyController>(builder: (personajeController){
      return (query!='')? ListView.builder(
        itemCount: personajeController.personajeSearch.length,
        itemBuilder: (context,i){
          final personaje = personajeController.personajeSearch[i];
          return ListTile(
            leading: CircleAvatar(  
              backgroundImage: NetworkImage(personaje.image!) ,
            ),
            title: Text(personaje.name!),
            subtitle: Text(personaje.status!),
          );

      }):Center(
        child: Text('...'),
      );
    });
  }

}