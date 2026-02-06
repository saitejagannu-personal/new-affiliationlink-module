// import 'package:flutter/material.dart';
// import 'package:flutter_new_project/home.dart';
// import 'package:flutter_new_project/splash_screen.dart';

// Route<dynamic> onGenerateRoute(RouteSettings settings) {
//    switch (settings.name) {
//     case '/':
//       return MaterialPageRoute(
//         builder: (ctx) => const SplashScreen(),
//       );
 
//     case '/login':
//       return MaterialPageRoute(
//         builder: (ctx) => HomeScreen(),
//       );
//       default:
//       return MaterialPageRoute(
//         builder: (ctx) => const Scaffold(
//           body: Center(
//             child: Text(
//               'Route not found',
//               style: TextStyle(fontSize: 18),
//             ),
//           ),
//         ),
//       );
//    }
// }


import 'package:flutter/material.dart';
import 'package:flutter_new_project/dashboard_screen.dart';
import 'package:flutter_new_project/home.dart';
import 'package:flutter_new_project/splash_screen.dart'; 
var onGenerateRoute =(RouteSettings settings) { 
  if(settings.name == "/" ) { return MaterialPageRoute(builder: (builder) => SplashScreen()); }
  else if(settings.name == "/login"){ return MaterialPageRoute(builder: (builder)=> HomeScreen());}
  else if(settings.name == DashboardScreen.routeName){ return MaterialPageRoute(builder: (builder)=> DashboardScreen(
    email: settings.arguments.toString()
    //name: "",
  ));
   }
 };