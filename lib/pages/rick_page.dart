import 'package:examenfinalmovil/controllers/ricky_controller.dart';
import 'package:examenfinalmovil/search/search_personaje.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RickPage extends StatelessWidget {
    RickPage({Key? key}) : super(key: key);

  //  final rickycontroller = Get.find<RickyController>();

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
        return (rickyController.cargando == true) ?Center(child: CircularProgressIndicator(),) : GridView.builder(
          shrinkWrap: true,
          itemCount: rickyController.personajes.length,
          itemBuilder: (context,i){
            final morty = rickyController.personajes[i];
            return Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  child: Stack(
                    children: [
                      Image.network('http://pa1.narvii.com/7635/a2c15379e0ada547e084edb7e390968cde0e495er1-350-350_00.gif'),
                      Column(  
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(morty.name!, style: TextStyle(  
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),),
                          Text(morty.status!),
                          Text(morty.species!),
                          Text(morty.gender!)
                        ],
                      ),
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
                  right: 10,
                  bottom: 15,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: FadeInImage(
                      fit: BoxFit.cover,height:120,
                      placeholder: AssetImage('assets/images/cargar.gif'),
                      image: NetworkImage(morty.image!,
                      )
                      ,
                      )
                    ),
                  ),
              ],
            );

          }, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),);

      }),
      );
  }
}