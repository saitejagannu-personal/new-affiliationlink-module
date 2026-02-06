import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
bool isChecked =false;
bool userUsagePolicy =false;
int selectGender= 0;
int selectLanguage =0;
String? selectedBank;


List<String> availableBanksList=["Sbi", "HSBC", "HDFC", "Union"];
class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Insta profile Screen "),
      backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Column(
           crossAxisAlignment: CrossAxisAlignment.start, 
          children: [        
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: CachedNetworkImageProvider("https://img.freepik.com/free-photo/lifestyle-beauty-fashion-people-emotions-concept-young-asian-female-office-manager-ceo-with-pleased-expression-standing-white-background-smiling-with-arms-crossed-chest_1258-59329.jpg?semt=ais_hybrid&w=740&q=80"),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        profileCounts("Posts", "0"),
                        profileCounts("Followers", "200"),
                        profileCounts("Followers", "150")
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: ElevatedButton.icon(onPressed: () {}, icon: Icon(Icons.person), label: Text("Follow"))
                  ),
                  SizedBox( width: 10),
                Expanded(
                  flex: 5,
                  child: ElevatedButton.icon(onPressed: () {}, icon: Icon(Icons.favorite), label: Text("Favourite"))
                  ),
              ],
            ),       
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Preferences"),
            ),
            Row(
              children: [
                Checkbox(value: isChecked, onChanged: (status) {
                  
                  setState(() {
                    isChecked = status!;
                  });
                }),
                Text("Aggred terms and conditions")
              ],
            ),  
            CheckboxListTile(value: userUsagePolicy,
            controlAffinity: ListTileControlAffinity.leading,
            title: Text("Please click on me"),
            subtitle: Text("if not don't"),
             onChanged: (value) {
              setState(() {
                userUsagePolicy = value!;
              });
            }),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("gender preferences"),
            ),
            RadioListTile(value: 0, groupValue: selectGender, title: const Text("Male"), onChanged: (value) {
              setState(() {
                selectGender =value!;
              });
            },),
        
            RadioListTile(value: 1, groupValue: selectGender, title: const Text("Female"), onChanged: (value) {
              setState(() {
                selectGender =value!;
              });
            },),
        
            RadioListTile(value: 2, groupValue: selectGender, title: const Text("TransGender"), onChanged: (value) {
              setState(() {
                selectGender =value!;
              });
            },),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Language Prefferences"),
            ),
            Row(
              children: [
                Radio(value: 0, groupValue: selectLanguage, onChanged:(value) {
                  setState(() {
                    selectLanguage =value!;
                  });
                },),
                Text("English"),
                Radio(value: 1, groupValue: selectLanguage, onChanged:(value) {
                  setState(() {
                    selectLanguage =value!;
                  });
                },),
                Text("Telugu"),
              ],
            ),
            Container(
              child: DropdownButton(
                value: selectedBank,
                items: availableBanksList.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
              //   items: [
              //   DropdownMenuItem( value : "Sbi", child: Text("Sbi")),
              //   DropdownMenuItem( value : "HSBC", child:Text("HSBC")),
              //   DropdownMenuItem( value : "HDFC", child: Text("HDFC")),
              //   DropdownMenuItem( value : "Union", child: Text("Union")),
              // ], 
              
                  onChanged: (value) {
                  print(value);
                  setState(() {
                    selectedBank =value!;
                  });
              }),
            )
        
          ],
        ),
      ),
    );
  }
  Widget profileCounts(String title, String count){ 
     return Column(children: [
        Text(title, style: TextStyle(fontWeight: FontWeight.bold),),
        Text(count)
  ]); 
  }
}