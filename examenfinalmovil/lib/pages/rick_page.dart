import 'package:flutter/material.dart';

class RickPage extends StatelessWidget {
  const RickPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(  
        title: Text('Rick & Morty'),
        backgroundColor: Colors.blue[300],
      ),
      body: Center(child: Container(  
        margin: EdgeInsets.symmetric(horizontal: 20),
        height: 410,
        width: double.infinity,
        child: Card(  
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(  
            borderRadius: BorderRadius.circular(25)
          ),
          elevation: 20,
          shadowColor: Colors.blue[700],
          child: Column(
            children: [
            FadeInImage(
              width: double.infinity,
              height: 290,
              fit: BoxFit.cover,
              placeholder: AssetImage('assets/images/loading.gif'), image: NetworkImage ('https://cdn.shopify.com/s/files/1/0520/5783/3638/products/il_1140xN.2744072243_27rb_1024x1024@2x.jpg?v=1612228901'))
          ]),
        ),
      )),
    );
  }
}