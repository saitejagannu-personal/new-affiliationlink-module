import 'package:flutter/material.dart';

class TabviewLayout extends StatefulWidget {
   const TabviewLayout({super.key});

  @override
  State<TabviewLayout> createState() => _TabviewLayoutState();
  
  
}

class _TabviewLayoutState extends State<TabviewLayout> 
with SingleTickerProviderStateMixin{
late TabController tabController;

@override
  void initState() {
    tabController =TabController(length: 3, vsync: this);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
      return 
    // DefaultTabController(
    //   length: 3,
    //   child: 
      Scaffold(
        appBar: AppBar(
          title: Text("My Tabview Layout"),
           bottom: TabBar(
            controller: tabController,
            tabs: [
              Tab(
                text: "flight",
                icon: Icon(Icons.flight),
              ),
                Tab(
                  text: "train",
                icon: Icon(Icons.directions_train),
              ),
                Tab(
                text: "car",
                icon: Icon(Icons.directions_car),
              ),
              ]),
        ),
        body: TabBarView(
          controller: tabController,
          children: [
          Column(
            children: [
              Icon(Icons.flight,
              size: 200),
              TextButton(onPressed: () {
            tabController.animateTo(1);
               }, child: Text("click me")),
            ],
          ),
          
           Icon(Icons.directions_train,
          size: 200),

           Icon(Icons.directions_car,
          size: 200,)
        ],),
      );
   // );
  }
}