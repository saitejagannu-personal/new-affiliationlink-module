import 'package:flutter/material.dart';
import 'package:flutter_new_project/registration_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_new_project/dashboard_screen.dart';

class HomeScreen extends StatelessWidget {

  TextEditingController phonetextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.teal,
        centerTitle: true,
        title: Text("Login Page"),
      ),
       backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Welcome to home page"),
              SizedBox(height: 20),
              InkWell(
                onTap: () {
                  print("InkWell tapped");
                },
                child: Text(
                  "inkwell",
                  style: GoogleFonts.poorStory(fontSize: 20),
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  print("GestureDetector tapped");
                },
                child: Text("gesture detector", style: TextStyle(fontSize: 20)),
              ),
              SizedBox(height: 10),
              Container(height: 100, width: 100, color: Colors.red),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  controller: phonetextEditingController,
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  decoration: InputDecoration(
                    label: Text('mobile number'),
                    prefixIcon: Icon(Icons.phone),
                    hintStyle: TextStyle(fontSize: 20, color: Colors.blue),
                    hintText: "enter your phone number",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  //  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx)=> DashboardScreen(
                  //           email: phonetextEditingController.text,
                  //           //name: phonetextEditingController.text,
                      
                  //         )), (route)=> false);

                  Navigator.of(context).pushNamedAndRemoveUntil(DashboardScreen.routeName, (route)=> false,
                  arguments: (phonetextEditingController.text,));
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      Colors.green, // 👈 this colors the whole button
                ),

                child: const Text("Login",
                style: TextStyle(color: Colors.white),),
              ),

              TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> RegistrationScreen()));
                },
                child: Text(
                  "don't you have an account",
                  style: TextStyle(color: Colors.red),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.all(8.0),
              //   child: TextField(
              //     maxLines: 5,
              //     decoration: InputDecoration(
              //         label: Text('Bio data'),
              //         hintStyle: TextStyle(fontSize: 20, color: Colors.blue),
              //         hintText: "Enter your bio data",
              //         border: OutlineInputBorder()),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );

  }
}
