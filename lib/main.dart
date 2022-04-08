import 'package:examenfinalmovil/api/peticiones_api.dart';
import 'package:examenfinalmovil/controllers/ricky_controller.dart';
import 'package:examenfinalmovil/pages/rick_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
void main(){
  Get.lazyPut(() => PeticionesApi());
  Get.lazyPut(() => RickyController());
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Examen final',
      initialRoute: '/rick',
      routes: {
        '/rick' : (context) => RickPage(),
      },
    );
  }
}