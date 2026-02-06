import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new_project/practice/practice_screeen.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
  
   @override void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      print("timer completed");
      Navigator.of(context).pushNamedAndRemoveUntil('/practice', (route)=> false);
    }
    );
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