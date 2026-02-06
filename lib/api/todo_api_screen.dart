import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TodoApiScreen extends StatefulWidget {
  const TodoApiScreen({super.key});

  @override
  State<TodoApiScreen> createState() => _TodoApiScreenState();
}

class _TodoApiScreenState extends State<TodoApiScreen> {
 
 getDataWithSynchronous() async{
  final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
   {
    print(response.statusCode);
    print(response.body);
  }
  
 }
  @override
  void initState() {
    getDataWithSynchronous();
  super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TODO"),
      backgroundColor: Colors.teal,
      ),
    );
  }
}