import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_new_project/practice/registration_screen2.dart';
import 'package:flutter_new_project/registration_screen.dart';

class PracticeScreeen extends StatefulWidget {
  const PracticeScreeen({super.key});

  @override
  State<PracticeScreeen> createState() => _PracticeScreeenState();
  
}


class _PracticeScreeenState extends State<PracticeScreeen> {
final _formKey = GlobalKey<FormState>();
final  emailController = TextEditingController();
final  passwordController =TextEditingController();
bool obscureText = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("login screen")),
      backgroundColor: Colors.blue),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(children: [
            Center(
              child: CachedNetworkImage(imageUrl: "https://thumbs.dreamstime.com/b/vector-illustration-isolated-white-background-login-button-icon-login-icon-button-126999961.jpg",
              width: 200,
              height:200,
              fit: BoxFit.cover,
              ),
            ),
            Text("Login now",
            style: TextStyle(
                fontSize: 24,
                ),
            ),
            const SizedBox(height: 20),

            Padding(
              padding: EdgeInsetsGeometry.all(20),
              child: TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  label: Text("enter email"),
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder()
                ),

                validator: (value) {
                  final bool emailValid = 
                  RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value ?? "");
                  print("email valid ${emailValid}");
                  if (value==null || value.isEmpty){
                  return ("enter email address");
                  }
                  else if (!emailValid) {
                    return (" enter valid email address");
                  }
                  return null;
                },
              ),
            ),

            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: obscureText,
                decoration: InputDecoration(
                  label: Text("enter password"),
                  border: OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.password),
                  suffixIcon: IconButton(icon: Icon(obscureText? Icons.visibility_outlined : Icons.visibility_off_outlined),
                  onPressed: () {
                    setState(() {
                      obscureText = !obscureText;
                    }
                    );                  
                  },
                ),
              ),

              validator: (value) {
                if (value==null || value.isEmpty || value.length <=8) {
                    return "please enter password";
                }
                return null;
              },

            )
            ),

            SizedBox( height: 20),

            TextButton(onPressed: () {
              if (_formKey.currentState!.validate()) {
                print("Email ${emailController.text}");
                print("Password ${passwordController.text}");
              }

            }, child: Text("Login",
            style: TextStyle(color: (Colors.blue)),
            )),

            TextButton(onPressed: () {
              //Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> RegistrationScreen2()));
              Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> RegistrationScreen2()));
            }, child: Text("dont have an account? register"))
          ],),
        ),
      ),
    );
  }
}