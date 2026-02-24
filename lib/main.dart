import 'package:flutter/material.dart';
import 'package:flutter_new_project/newproject/newdashboard_screen.dart';
import 'package:flutter_new_project/newproject/newhome_screeen.dart';
import 'package:flutter_new_project/practice/practice_screeen.dart';
import 'package:flutter_new_project/practice/splash_screen2.dart';
import 'package:flutter_new_project/dashboard_screen.dart';
import 'package:flutter_new_project/home.dart';
import 'package:flutter_new_project/providers/shopping_provider.dart';
import 'package:flutter_new_project/registration_screen.dart';
import 'package:flutter_new_project/counter_screen.dart';
import 'package:flutter_new_project/splash_screen.dart';
import 'package:flutter_new_project/Navigations/routes.dart';
import 'package:flutter_new_project/newproject/newhome_screeen.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';

final ThemeData lightTheme = ThemeData.light().copyWith(
  primaryColor: Colors.blue,
  appBarTheme: const AppBarTheme(backgroundColor: Colors.blue),
);
final ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: Colors.deepPurple,
  appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ShoppingProvider())],
      child: GetMaterialApp(
       theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: ThemeMode.system,

        // home: RegistrationScreen(),
        // theme: ThemeData(fontFamily: "singleDay"),
        //home: NinjaCard(),
        //home: HomeScreen(),
        // home: CounterScreen(),
        //home: SplashScreen(),
        //home: DashboardScreen(),
        //home: PracticeScreeen(),
        initialRoute: '/', //--> this is how to use the initial route
        routes: {
          //'/' : (context) => NewhomeScreeen(),
          //  '/newdashboard' : (context) => NewdashboardScreen(),
          //'/login': (context) => HomeScreen(),
          //'/practice': (context) => PracticeScreeen()
        },
        onGenerateRoute: onGenerateRoute,
      ),
    );
  }
}

class NinjaCard extends StatefulWidget {
  @override
  State<NinjaCard> createState() => _NinjaCardState();
}

class _NinjaCardState extends State<NinjaCard> {
  int ninjaLevel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 194, 170, 170),
      appBar: AppBar(
        title: Text('Ninja ID Card'),
        centerTitle: true,
        backgroundColor: Color(0xff302727),
        foregroundColor: Colors.white,
        elevation: 0.0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            ninjaLevel += 1;
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                //backgroundImage: AssetImage('assets/cat.jpg'),
                radius: 40.0,
              ),
            ),
            Divider(height: 60.0, color: Color(0xff3a2c03)),
            Text(
              'NAME',
              style: TextStyle(color: Colors.black, letterSpacing: 2.0),
            ),
            SizedBox(height: 10.0),
            Text(
              'Sai Teja',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.0),
            Text(
              'Current Ninja Level',
              style: TextStyle(color: Colors.black, letterSpacing: 2.0),
            ),
            SizedBox(height: 10.0),
            Text(
              '$ninjaLevel',
              style: TextStyle(
                color: Colors.black,
                letterSpacing: 2.0,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30.0),
            Row(
              children: [
                Icon(Icons.email, color: Color(0xff011b31)),
                SizedBox(width: 10.0),
                Text(
                  'saitejagannu123@gmail.com',
                  style: TextStyle(letterSpacing: 1.0),
                ),
              ],
            ),
          ], // widget
        ),
      ),
    );
  }
}
