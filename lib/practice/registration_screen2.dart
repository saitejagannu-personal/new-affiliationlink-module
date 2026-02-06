import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RegistrationScreen2 extends StatefulWidget {
  const RegistrationScreen2({super.key});

  @override
  State<RegistrationScreen2> createState() => _RegistrationScreen2State();
}
final _formKey = GlobalKey<FormState>();

final nameController =TextEditingController();
final emailController =TextEditingController();
final passwordController = TextEditingController();

bool obscureText =true;


class _RegistrationScreen2State extends State<RegistrationScreen2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(title: Text("Registration Screen"),
      centerTitle: true,
      backgroundColor: Colors.teal
      ),
      

      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(children: [
            SizedBox (height: 10),
            CachedNetworkImage(imageUrl: "https://thumbs.dreamstime.com/b/registration-online-membership-network-internet-business-technology-concept-104512007.jpg",
            height: 200,
            width: double.infinity),
          Text("Register Now",
          style: TextStyle(fontSize: 24),
          ),

          SizedBox( height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    label: Text("enter name"),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person)
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "please enter name";
                    }
                  },
                ),
              ),

              SizedBox( height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    label: Text("enter email"),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email)
                  ),
                  validator: (value) {
                  
                  final bool emailValid = 
                  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value ?? "");
                  print("enter email ${emailValid}");

                  if (value == null || value.isEmpty) {
                      return "enter email address";        
                  }
                    else if (!emailValid) {
                      return "enter valid email";
                    }
                  },
                ),
              ),

                Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    label: Text("enter password"),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.password_outlined),
                    suffixIcon: IconButton(onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    }, icon: Icon(obscureText? Icons.visibility_outlined : Icons.visibility_off_outlined))
                  ),

                  validator: (value) {
                    if ( value == null || value.isEmpty|| value.length<=8) {
                      return "please enter password";
                    }
                    return null;
                  },
                ),
                ),
                  TextButton(onPressed: () {
                    if ( _formKey.currentState!.validate()) {
                      print("name ${nameController}");
                      print("email ${emailController}");
                      print("password ${passwordController}");
                    }
                  }, child: Text("Register"))
          ],),
        ),
      ),
    );
  }
}