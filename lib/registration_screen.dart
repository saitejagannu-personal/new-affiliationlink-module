import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';
import 'package:flutter_new_project/dashboard_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool visiblePassword = false;
  Uint8List? imageBytes;

  final _formKey = GlobalKey<FormState>();

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  final FocusNode nameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();


  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    print("initState Called");
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDependencies Called");
  }

  String defaultImage =
      "https://efilingbihar.com/wp-content/uploads/2020/09/287-2874255_seller-registration-icon-class-register-icon-png-transparent.png";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: Text("Registration Screen"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(children: [
              CachedNetworkImage(
                imageUrl:
                    "https://www.shutterstock.com/image-vector/welcome-lettering-logo-handdrawn-sign-260nw-2484780413.jpg",
                height: 100,
                width: 100,
              ),
              Text(
                "welcome to the registration screen, enjoy your shopping",
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              Stack(
                children: [
                  imageBytes != null
                      ? CircleAvatar(
                          radius: 40,
                          backgroundImage: MemoryImage(imageBytes!),
                        )
                      : CircleAvatar(
                          radius: 40,
                          backgroundImage:
                              CachedNetworkImageProvider(defaultImage),
                              
                        ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () async {
                        ImagePicker imagePicker = ImagePicker();
                        final XFile? xfile = await imagePicker.pickImage(
                          source: ImageSource.gallery,
                          imageQuality: 30,
                        );
                        if (xfile != null) {
                          final bytes = await xfile.readAsBytes();
                          setState(() {
                            imageBytes = bytes;
                          });
                        }
                      },
                      child: const Icon(Icons.photo_camera),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: nameTextEditingController,
                
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the name';
                  }
                  return null;
                },
                focusNode: nameFocus,
                textInputAction: TextInputAction.next,
                onEditingComplete: () {
                  print("move to next line");
                  FocusScope.of(context).nextFocus();
                },
                decoration: InputDecoration(
                  hintText: "Enter name",
                  label: Text("Name"),
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: emailTextEditingController,
                focusNode: emailFocus,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                onEditingComplete: () {
                  print("move to next line");
                  FocusScope.of(context).nextFocus();
                },
                validator: (value) {
                  final bool emailValid = RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value ?? "");
                  print("emailValid ${emailValid}");
                  
                  if (value == null || value.isEmpty) {
                    return "Please enter email address";

                  } else if (!emailValid) {
                    return "Please enter valid email address";
                  }
                  return null;
                },
                decoration: InputDecoration(
                  hintText: "Enter Email",
                  label: Text("email"),
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: passwordTextEditingController,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length <= 8) {
                    return "Password should be atleast 8 characters";
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                obscureText: visiblePassword,
                decoration: InputDecoration(
                  hintText: "Enter password",
                  label: const Text("password"),
                  prefixIcon: const Icon(Icons.password),
                  suffixIcon: InkWell(
                      onTap: () {
                        setState(() {
                          visiblePassword = !visiblePassword;
                        });
                      },
                      child: Icon(visiblePassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined)),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    // Navigator.of(context).push(route); --> move to the next page
                    // Navigator.of(context).pushNamedAndRemoveUntil(newRouteName, predicate); --> push to that page and it will remove all the previopus pages
                    // Navigator.of(context).pushReplacement(newRoute); --> it will be used to show one screen upon another and it will replace the old screen.

                //These 3 we will use more in flutter

                //Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => DashboardScreen()));

                

                  //validate();
                    print(nameTextEditingController.text);
                    print(emailTextEditingController.text);
                    print(passwordTextEditingController.text);

                  if (!_formKey.currentState!.validate()) {
                          return;
                        }
                    if (imageBytes == null) {
                      print("Please select image");
                      Fluttertoast.showToast(msg: "Please select image");
                      return;
                    }
                    if (_formKey.currentState!.validate()) {
                      print("processing your request");
                      Fluttertoast.showToast(
                          msg: "Account creatted Successfully");
                          Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx)=> DashboardScreen(
                            //name: nameTextEditingController.text,
                            email: emailTextEditingController.text,
                          )), (route)=> false);
                    } else {
                      print("Something went Wrong");
                    }
                  },
                  child: Text("Register")),
              TextButton(
                  onPressed: () {
                    nameTextEditingController.clear();
                    emailTextEditingController.clear();
                    passwordTextEditingController.clear();
                  },
                  child: Text(
                    "Clear values",
                    style: TextStyle(color: Colors.purple),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Already Regsitered- Login now",
                    style: TextStyle(color: Colors.blue),
                  )),
            ]),
          ),
        ),
      ),
    );
  }

   validate() {
    // String name, email, password;
    // name = nameTextEditingController.text;
    // email = emailTextEditingController.text;
    // password = passwordTextEditingController.text;

    // if (name.isEmpty) {
    //   Fluttertoast.showToast(msg: "enter valid name");
    // } else if (email.isEmpty) {
    //   Fluttertoast.showToast(msg: "enter valid email");
    // } else if (password.isEmpty) {
    //   Fluttertoast.showToast(msg: "enter valid password");
    // } else {
    //   Fluttertoast.showToast(msg: "successflly registered");
    //   Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx)=> DashboardScreen(
    //     email: email,
    //     name: name,
    //   )), (route)=> false);
    // }
   }

  @override
  void didUpdateWidget(covariant RegistrationScreen oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget Called");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose Called");
  }
}



