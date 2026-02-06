import 'package:flutter/material.dart';
import 'package:flutter_new_project/Dashboard/person_screen.dart';
import 'package:flutter_new_project/Dashboard/subscription_screen.dart';
import 'package:flutter_new_project/Dashboard/video_screen.dart';
import 'package:flutter_new_project/Widget/drawer_item_widget.dart';
import 'package:flutter_new_project/api/todo_api_screen.dart';
import 'package:flutter_new_project/home.dart';
import 'package:flutter_new_project/main.dart';
import 'package:flutter_new_project/pageview_screen.dart';
import 'package:flutter_new_project/profile_screen.dart';
import 'package:flutter_new_project/splash_screen.dart';
import 'package:flutter_new_project/tabview_layout.dart';

class DashboardScreen extends StatefulWidget {
  static const String routeName = "/DashboardScreen"; 
  String email;

  DashboardScreen({required this.email});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentIndex = 0;
  List DashboardScreen = [
    NinjaCard(),
    VideoScreen(),
    SubscriptionScreen(),
    PersonScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        backgroundColor: Colors.teal,
        title: const Text("Dashboard Screen"),
        actions: [
          Icon(Icons.search_outlined, color: Colors.white,),
          InkWell(onTap: () {
            showModalBottomSheet(context: context, builder: (ctx) {
              return Column(
                children: [
                   ListTile(title: Text("Filter by Name"),),
                   ListTile(title: Text("Filter by Age"),),
                   ListTile(title: Text("Filter by Price"),),
                   TextButton(onPressed: () {
                    Navigator.pop(context);
                   }, 
                   child: Text("close"))
                  
                ],
              );
            });
          },
            
            child: Icon(Icons.filter_alt, color: Colors.white,)),
    
    
          IconButton(onPressed: (){
            //Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx) => SplashScreen()), (Route)=> false);
           showDialog(context: context, builder: (ctx) {
            return AlertDialog(
              title: Text("Log Out"),
              content: Text("Do you want to really logout"),
              actions: [
                TextButton(onPressed: () {
                  Navigator.pop(context);
                }, child: Text("No")),
                TextButton(onPressed: () {
                  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx) => SplashScreen()), (Route)=> false);
                }, child: Text("Yes"))
              ],
            );
           });  
          },
           icon: Icon(Icons.logout_outlined, color: Colors.red))
        ],
    ),
    drawer: Drawer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Container(
          width: double.infinity,
          child: DrawerHeader(child: Text("Flutter and dart"),
          decoration: BoxDecoration(color: Colors.blue)
          ),
        ),
    
        DrawerItemWidget(
          title: ("TODO API"),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (ctx)=> TodoApiScreen()));
          },
        ),
        DrawerItemWidget(
          title: ("Profile page"),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (ctx)=> ProfileScreen()));
          },
        ),
        DrawerItemWidget(
          title: ("Pageview Layout"),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (ctx)=> PageviewScreen()));
          },
        ),
        DrawerItemWidget(
          title: ("Tab Layout"),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (ctx)=> TabviewLayout()));
          },
        ),
        DrawerItemWidget(
          title: ("home"),
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (ctx)=> VideoScreen()));
          },
        ),
        DrawerItemWidget(
          title: ("logout"),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        DrawerItemWidget(),
        // TextButton(onPressed: () {}, child: Text("Home")),
        // Divider(),
    
        // TextButton.icon(onPressed: () {
        // }, icon: Icon(Icons.logout_outlined), label: Text("Logout"))
    
      ]),
    ),
    bottomNavigationBar: BottomNavigationBar(
      unselectedItemColor: Colors.grey,
      selectedItemColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      onTap: (position) {
        //print("position: ${position}");
        currentIndex = position;
        setState(() {
          currentIndex = position;
        });
        
      },
      items: const [BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.play_circle), label: "Videos"),
      BottomNavigationBarItem(icon: Icon(Icons.subscriptions_outlined), label: "subscriptions"),
      BottomNavigationBarItem(icon: Icon(Icons.person_outlined), label: "person"),
      ]),
    
      body: DashboardScreen [currentIndex],
    // body: Column(
    //   children: [
    //     Text("user logged in as ${widget.email}"),
    //     ElevatedButton(onPressed: () {
    //     Navigator.pop(context);
    //   },
    //   child: Text("Go back"))
    //   ],
    // ),
    );
  }
}