import 'package:examenfinalmovil/controllers/ricky_controller.dart';
import 'package:examenfinalmovil/search/search_personaje.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RickPage extends StatelessWidget {
    RickPage({Key? key}) : super(key: key);

   final rickycontroller = Get.find<RickyController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar( 
        actions: [
          IconButton(
            tooltip: 'Buscar Personaje',
            onPressed: (){
              showSearch(context: context, delegate: SearchPersonaje());
            },
             icon: Icon(Icons.search))
        ], 
        title: Text('Rick & Morty'),
        backgroundColor: Colors.blue[300],
      ),

      body: GetBuilder<RickyController>(builder: (rickyController){
        return GridView.builder(
          shrinkWrap: true,
          itemCount: rickycontroller.personajes.length,
          itemBuilder: (context,i){
            final morty = rickycontroller.personajes[i];
            return Stack(
              children: [
                Container(
                  child: Column(  
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(morty.name!, style: TextStyle(  
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),),
                      Text(morty.status!),
                    ],
                  ),
                  margin: EdgeInsets.all(5),
                  width: double.infinity,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.red[100]
                  ),
                ),
                Positioned(
                  right: 45,
                  bottom: 75,
                  child: Image.network(morty.image!,
                  fit: BoxFit.fill,height:120,
                  ),
                )
              ],
            );

          }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),);

      }),
      floatingActionButton: FloatingActionButton(onPressed: () {
        rickycontroller.obtenerCharacter();
      },
      child: Icon(Icons.add),
      ),
      );
  }
}