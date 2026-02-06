import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewdashboardScreen extends StatefulWidget {
  const NewdashboardScreen({super.key});

  @override
  State<NewdashboardScreen> createState() => _NewdashboardScreenState();
}
late PageController _pageController;

class _NewdashboardScreenState extends State<NewdashboardScreen> {
Timer? _timer;
int currentIndex =0;

@override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
  if (currentIndex < 2) {
    currentIndex++;
  } else {
    currentIndex = 0;
  }

  _pageController.animateToPage(
    currentIndex,
    duration: const Duration(milliseconds: 400),
    curve: Curves.easeIn,
  );
});
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       //backgroundColor: Color(0xFF2C2C2E),
      body: Column(children: [
        SizedBox(height: 30),
        Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              height: 350,
              width: double.infinity,
               decoration: BoxDecoration(
               color: const Color.fromARGB(255, 98, 107, 100),
                  borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Offers and Deals",
                        style: TextStyle(color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                        ),
                        ),
                      ),
                      Expanded(
                        child: PageView(
                          controller: _pageController,
                          onPageChanged: (index) {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                          children: [
                            pageViewLayout("https://assets.aboutamazon.com/dims4/default/0acc6e7/2147483647/strip/false/crop/1280x720+0+0/resize/1200x675!/quality/90/?url=https%3A%2F%2Famazon-blogs-brightspot.s3.amazonaws.com%2F94%2F6d%2F08b35e09423ca8769d6b61cafec8%2Fdeal-reveal.jpg"),
                            pageViewLayout("https://www.shoppre.com/img/shoppre/shopping-festival-deals.jpg"),
                            pageViewLayout("https://www.mobilityindia.com/wp-content/uploads/2024/08/Lotus-Electronics-Unveils-Independence-Deal-Festival-Massive-Discounts-Up-to-70.jpg"),
                           
                          ],
                      )),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          brandAvatar("https://s3.amazonaws.com/cdn.designcrowd.com/blog/40-Famous-Shoe-Logos/Nike.png"),
                          brandAvatar("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJA6_I2J62S1XcbvT_ErFj2iQB9xejSixBow&s"),
                          brandAvatar("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrrGWyyRdhy6KnlaTLHfQS33vZZX_4So_Scg&s"),
                          brandAvatar("https://www.shutterstock.com/image-vector/stylish-minimalist-hype-shoes-logo-260nw-2609214233.jpg"),
                        ],
                      ),
                        SizedBox( height: 20,)
                    ],
                  ),
            ),

            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              width: 335,
              height: 239,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 98, 107, 100),
                borderRadius: BorderRadius.circular(10),
                
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkeTq1nfn53FNKUJiLIePLFiXHzCHcDP-leA&s",
                        fit: BoxFit.cover,
                        height: double.infinity,
                        ),
                      ),
                    )
                   ),
                   SizedBox( width: 10),

                  Expanded(
                    flex: 1,
                    child: Column(
                    children: [
                        Expanded(
                         child: Padding(
                           padding: const EdgeInsets.all(5.0),
                           child: ClipRRect(
                             borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                             "https://www.balajimultisales.in/images/E3.jpg",
                                             fit: BoxFit.cover,
                                             width: double.infinity,
                                           ),
                                         ),
                         ),
            ),

                const SizedBox(height: 8),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRy1zI0rSsuNP6pTq4NpKCZlO2yvhVDVaiupg&s",
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
                    
                    ],
                   ),)
                ],
              ),
            )
          ],
        )
      ],),

      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        
        
        items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home) , label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.category) , label: "Categories"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_outline) , label: "Favourites"),
        BottomNavigationBarItem(icon: Icon(Icons.wallet) , label: "wallet"),

      ]),
    );

  }
  Widget pageViewLayout (String imageUrl){
  return Padding(
    padding: EdgeInsets.all(10),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(imageUrl,
      fit: BoxFit.cover,
      ),
      ),
    );
  }
  Widget brandAvatar (String url) {
    return CircleAvatar(
      radius: 30,
      backgroundImage: NetworkImage(url),
    );
  }
}

  // Row(children: [
  //               allItems("assets/images/image12.png"),
  //               allItems("assets/images/image13.png"),
  //               allItems("assets/images/image14.png"),
  //             ],)
