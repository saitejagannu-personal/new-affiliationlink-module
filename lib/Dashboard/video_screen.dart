import 'package:flutter/material.dart';

class VideoScreen extends StatelessWidget {
  final ScrollController scrollController =ScrollController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: ListView( ------------>>> this is only for some period if we need more count we need to use listview builder
      //   shrinkWrap: true,
      //   reverse: false,
      //   children: [
      //   myContainer(index: 0),
      //   myContainer(index: 1,color: Colors.white),
      //   myContainer(index: 2),
      // ],),
      // body: ListView.builder(    -----> one more method with out divider
      //   itemCount: 50,
      //   itemBuilder:(context, index) {
      //   return myContainer(index: index);
      // },),

       body: Scrollbar(
        controller: scrollController,
        thumbVisibility: true,
        interactive: true,
        thickness: 8,
         child: ListView.separated(   //-------------> this is used to give the divider adn we can also apply properties in it.
          controller: scrollController,
          itemCount: 50,
          itemBuilder:(context, index) {
          return myContainer(index: index);
               }, separatorBuilder: (BuildContext context, int index) { 
          return Divider();
         },),
       ),
    );
  }

   dynamic myContainer({required int index, Color color= Colors.amber}){
      return Container(
          //color: color,
          height: 300,
          width: double.infinity,
          color: index == 5 ? Colors.red : Colors.green, 
          child: Center(child: Text("$index",
          style: TextStyle(fontSize: 100),
          ),
          ),
          );

  }
}