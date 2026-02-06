import 'package:flutter/material.dart';

class PersonScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: 20,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (BuildContext context, int index) { 
      return InkWell( 
        onTap:() {
          
        },
        child: Card(child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon( Icons.home),
            Text("item $index"),
        
          ],
        )),
      );
       },),
    );
  }
} 