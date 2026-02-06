import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new_project/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
@override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), (){
      print("Timer completed");
      //Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx)=> HomeScreen()), (Route) => false);
      Navigator.of(context).pushNamedAndRemoveUntil("/login", (route) => false);
      
    });
   
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            Center(
              child: CachedNetworkImage(
                  imageUrl:
                      "https://www.shutterstock.com/image-vector/welcome-lettering-logo-handdrawn-sign-260nw-2484780413.jpg",
                  height: 100,
                  width: 100,
                  
                ),
            ),
              Text("Welcome to OneInfo",
              style: TextStyle(color: Colors.white),

              )
        ],
      ),
    );
  }
}