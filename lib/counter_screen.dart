import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  Color myContainerColor = Colors.green;
  int count = 0;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Counter Screen"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            count = count + 1;
          });

          print("count is $count");
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            child: Text(
              "$count",
              style: TextStyle(fontSize: 18),
            ),
            radius: 32,
            backgroundColor: Colors.blue,
          ),
          SizedBox(height: 10),
          Container(
            width: 100,
            height: 100,
            color: myContainerColor,
          ),
          ElevatedButton(
              onPressed: () {
                myContainerColor = Colors.yellow;
                setState(() {});
                print("Color changed to yellow");
              },
              child: Text("Change Color to yellow")),
          ElevatedButton(
              onPressed: () {
                myContainerColor = Colors.red;
                setState(() {});
              },
              child: Text("Change Color to Red")),
        ],
      ),
    );
  }

  @override
  void didUpdateWidget(covariant CounterScreen oldWidget) {
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
