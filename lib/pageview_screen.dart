import 'package:flutter/material.dart';

class PageviewScreen extends StatefulWidget {

  @override
  State<PageviewScreen> createState() => _PageviewScreenState();
}

class _PageviewScreenState extends State<PageviewScreen> {
PageController pageController = PageController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pageview Layout"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        pageController.nextPage(duration: Duration(seconds: 1), curve: Curves.linear);
      }, child: Icon(Icons.skip_next),),
      body: PageView(
        onPageChanged: (value) {
          print("value ${value}");
        },
        controller: pageController,
        scrollDirection: Axis.vertical,
        children: [
          myPage(0),
          myPage(1),
          myPage(2),
          myPage(3),
        ],
      ),
    );
  }
  Widget myPage(int index) {
    return Center(child: Text("Page ${index}", style: TextStyle(fontSize: 30),)
    );
  }

}