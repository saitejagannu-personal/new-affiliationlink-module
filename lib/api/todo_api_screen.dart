import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TodoApiScreen extends StatefulWidget {
  const TodoApiScreen({super.key});

  @override
  State<TodoApiScreen> createState() => _TodoApiScreenState();
}

class _TodoApiScreenState extends State<TodoApiScreen> {
  //synchronous
  String data = "NA";
  getDataWithAsynchronous() async{
     http.Response response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
        print(response.statusCode);
        if (response.statusCode ==200) {
        
        setState(() {
          data = response.body;
        }); 
  }}

  @override
  void initState() {
    getDataWithAsynchronous();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TODO"), backgroundColor: Colors.teal),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
       child: SelectableText( 
        data,
       style: TextStyle(fontSize: 14), 
      ),
      ),
    );
  }
}
