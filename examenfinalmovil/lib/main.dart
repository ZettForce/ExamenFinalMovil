import 'package:examenfinalmovil/pages/rick_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Examen final',
      initialRoute: '/rick',
      routes: {
        '/rick' : (context) =>  const RickPage(),
      },
    );
  }
}