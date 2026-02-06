import 'package:flutter/material.dart';
import 'package:flutter_new_project/newproject/newdashboard_screen.dart';
import 'dart:async';

class NewhomeScreeen extends StatefulWidget {
  const NewhomeScreeen({super.key});

  @override
  State<NewhomeScreeen> createState() => _NewhomeScreeenState();
}

class _NewhomeScreeenState extends State<NewhomeScreeen>
    with SingleTickerProviderStateMixin {
  Timer? _timer;
  int bannerIndex = 0; // for PageView
  int bottomNavIndex = 0;
  late PageController _pageController;
  late PageController _scrollController;
  int _scrollIndex = 0;
  Timer? _scrollTimer;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    tabController = TabController(length: 3, vsync: this);

    _timer = Timer.periodic(const Duration(seconds: 3), (Timer timer) {
      if (!mounted) return;

      setState(() {
        bannerIndex =
            (bannerIndex + 1) % 3; // change 3 to images.length if using list
      });

      _pageController.animateToPage(
        bannerIndex,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    });

    _scrollController = PageController(initialPage: 0);

    _scrollTimer = Timer.periodic(const Duration(seconds: 3), (
      Timer _scrollTimer,
    ) {
      if (!mounted) return;

      setState(() {
        _scrollIndex =
            (_scrollIndex + 1) % 2; // change 3 to images.length if using list
      });

      _scrollController.animateToPage(
        _scrollIndex,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeIn,
      );
    });
  }

  void dispose() {
    _pageController.dispose();
    _scrollController.dispose();
    
    tabController.dispose();
    _timer?.cancel();
    _scrollTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          children: [
            Icon(Icons.location_on_outlined, color: Colors.white),
            SizedBox(width: 10),
            Text(
              "Hyderabad",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Container(
            height: 45,
            width: 338,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 233, 218, 218),
              borderRadius: BorderRadius.circular(20),
            ),
            child: TextField(
              style: TextStyle(color: Colors.black),
              decoration: InputDecoration(
                hintText: "Search for Brands/Stores...",
                hintStyle: TextStyle(color: Colors.black),
                prefixIcon: Icon(Icons.search, color: Colors.black),
                border: InputBorder.none,
              ),
            ),
          ),
        ),
      ),
        
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                height: 397,
                width: 342,
                margin: EdgeInsets.symmetric(horizontal: 20),
        
                decoration: BoxDecoration(
                  color: const Color.fromARGB(46, 46, 46, 45),
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage("assets/images/bg_image.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
        
              // ElevatedButton(
              // onPressed: () {
              //   Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => NewdashboardScreen()));
              // },
              // style: ElevatedButton.styleFrom(
              //   backgroundColor: const Color.fromARGB(255, 199, 101, 71)
              // ),
              // child: Text("How it works >",
              // style: TextStyle( color: Colors.white),
              // )),
              SizedBox(height: 20),
              Container(
                height: 184,
                width: 335,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 233, 218, 218),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Top Content Creaters",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
        
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        creatorCard(
                          "assets/images/image36.jpg", 4.2,"(Reviews)",
                        ),
                        creatorCard(
                          "assets/images/image37.jpg", 3.5, "(Reviews)",
                        ),
                        creatorCard(
                          "assets/images/image38.jpg", 4.5, "(Reviews)",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 350,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 233, 218, 218),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Offers and Deals",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: PageView(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            bannerIndex = index;
                          });
                        },
                        children: [
                          pageViewLayout(
                            "https://assets.aboutamazon.com/dims4/default/0acc6e7/2147483647/strip/false/crop/1280x720+0+0/resize/1200x675!/quality/90/?url=https%3A%2F%2Famazon-blogs-brightspot.s3.amazonaws.com%2F94%2F6d%2F08b35e09423ca8769d6b61cafec8%2Fdeal-reveal.jpg",
                          ),
                          pageViewLayout(
                            "https://www.shoppre.com/img/shoppre/shopping-festival-deals.jpg",
                          ),
                          pageViewLayout(
                            "https://www.mobilityindia.com/wp-content/uploads/2024/08/Lotus-Electronics-Unveils-Independence-Deal-Festival-Massive-Discounts-Up-to-70.jpg",
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        brandAvatar(
                          "https://s3.amazonaws.com/cdn.designcrowd.com/blog/40-Famous-Shoe-Logos/Nike.png",
                        ),
                        brandAvatar(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSJA6_I2J62S1XcbvT_ErFj2iQB9xejSixBow&s",
                        ),
                        brandAvatar(
                          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQrrGWyyRdhy6KnlaTLHfQS33vZZX_4So_Scg&s",
                        ),
                        brandAvatar(
                          "https://www.shutterstock.com/image-vector/stylish-minimalist-hype-shoes-logo-260nw-2609214233.jpg",
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              SizedBox(height: 30),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 239,
                width: 335,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 233, 218, 218),
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
                          child: Image.asset(
                            "assets/images/image1.png",
                            fit: BoxFit.cover,
                            height: double.infinity,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
        
                    Expanded(
                      flex: 1,
                      child: Column(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.asset(
                                  "assets/images/image3.png",
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
                                child: Image.asset(
                                  "assets/images/image2.png",
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                height: 370,
                width: 335,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 233, 218, 218),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Wednesday: Lunch Break",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        newCard("assets/images/image4.png"),
                        newCard("assets/images/image5.png"),
                      ],
                    ),
                    SizedBox(height: 5),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Offers from top restaurant",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        foodAvatar("assets/images/image6.png"),
                        foodAvatar("assets/images/image7.png"),
                        foodAvatar("assets/images/image8.png"),
                        foodAvatar("assets/images/image9.png"),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    height: 158,
                    width: 335,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromARGB(255, 233, 218, 218),
                      image: DecorationImage(
                        image: AssetImage("assets/images/image11.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: 335,
                    height: 237,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromARGB(255, 233, 218, 218),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Great Deals Today only",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  allItems("assets/images/image12.png"),
                                  allItems("assets/images/image13.png"),
                                  allItems("assets/images/image14.png"),
                                ],
                              ),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  allItems("assets/images/image15.png"),
                                  allItems("assets/images/image16.png"),
                                  allItems("assets/images/image17.png"),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 32,
                    width: 320,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    color: Colors.black,
                    child: Text(
                      "Top Demand selling offers",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                height: 90,
                width: 335,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromARGB(255, 233, 218, 218),
                ),
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    scrollCard("assets/images/image18.png"),
                    SizedBox(width: 15),
                    scrollCard("assets/images/image19.png"),
                    SizedBox(width: 15),
                    scrollCard("assets/images/image20.png"),
                    SizedBox(width: 15),
                    scrollCard("assets/images/image21.png"),
                    SizedBox(width: 15),
                    scrollCard("assets/images/image21.png"),
                    SizedBox(width: 15),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 32,
                    width: 320,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    color: Colors.black,
                    child: Text(
                      "Amazing Big Deal Today",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 15),
              Container(
                height: 190,
                width: 335,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromARGB(255, 233, 218, 218),
                ),
                child: PageView(
                  controller: _scrollController,
                  onPageChanged: (index) {
                    setState(() {
                      _scrollIndex = index;
                    });
                  },
                  scrollDirection: Axis.horizontal,
                  children: [
                    bigDealCard("assets/images/image22.png"),
                    //SizedBox(width: 20),
                    bigDealCard("assets/images/image23.png"),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  Container(
                    height: 237,
                    width: 335,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 233, 218, 218),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Great offers on Electronics",
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                greatOffers("assets/images/image24.png"),
                                greatOffers("assets/images/image25.png"),
                                greatOffers("assets/images/image26.png"),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                greatOffers("assets/images/image27.png"),
                                greatOffers("assets/images/image28.png"),
                                greatOffers("assets/images/image29.png"),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    height: 620,
                    width: 335,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color.fromARGB(255, 233, 218, 218),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TabBar(
                            labelColor: Colors.white,
                            unselectedLabelColor: Colors.grey,
                            indicator: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [Colors.orange, Colors.pink],
                              ),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            indicatorSize: TabBarIndicatorSize.tab,
                            controller: tabController,
                            tabs: [
                              Tab(
                                child: Text(
                                  "All",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "Kurta Sets",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              Tab(
                                child: Text(
                                  "Shoes",
                                  style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox( height: 20),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                              finalItems("assets/images/image30.png"),
                              finalItems("assets/images/image31.png"),
                            ],),
                            SizedBox( height: 10),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                              finalItems("assets/images/image32.png"),
                              finalItems("assets/images/image33.png"),
                            ],),
                            SizedBox( height: 10),
                             Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                              finalItems("assets/images/image34.png"),
                              finalItems("assets/images/image35.png"),
                            ],),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  // SizedBox(
                  //   height: 400,
                  //   child: TabBarView(
                  //     controller: tabController,
                  //     children: [
                  //       // Text("All", style: TextStyle(color: Colors.white)),
                  //       // Text("Kurta Sets", style: TextStyle(color: Colors.white)),
                  //       // Text("Shoes", style: TextStyle(color: Colors.white)),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        currentIndex: bottomNavIndex,
        onTap: (value) {
          setState(() {
            bottomNavIndex = value;
          });
        },

        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_outline),
            label: "Favourites",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.wallet), label: "wallet"),
        ],
      ),
    );
  }

  Widget creatorCard(String imagePath,double rating, String name ) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 110,
          width: 85,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: 90,
          height: 30,
          margin: EdgeInsets.only(bottom :0),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
          ),
          child: Row(
            children: [
              const Icon(Icons.star, color: Colors.yellow, size: 12), 
              const SizedBox(width: 4),
              Text(
                "$rating $name",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget pageViewLayout(String imageUrl) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(imageUrl, fit: BoxFit.cover,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return Center(child: CircularProgressIndicator());
        },
        errorBuilder: (context, error, stackTrace) {
          return Center(
            child: Icon(Icons.broken_image, size: 50, color: Colors.red),
          );
        }
        ),
      ),
    );
  }
Widget brandAvatar(String url) {
  return CircleAvatar(
    radius: 30,
    backgroundColor: Colors.grey[200],
    child: ClipOval(
      child: Image.network(
        url,
        width: 60,
        height: 60,
        fit: BoxFit.cover,

        // Shows loader while downloading
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return const Center(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        },

        // Shows icon if image fails
        errorBuilder: (context, error, stackTrace) {
          return const Icon(
            Icons.broken_image,
            color: Colors.red,
            size: 28,
          );
        },
      ),
    ),
  );
}

  Widget newCard(String imagePath) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 166,
            width: 132,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget foodAvatar(String imagePath) {
    return SizedBox(
      height: 65,
      width: 65,
      child: CircleAvatar(backgroundImage: AssetImage(imagePath)),
    );
  }

  Widget allItems(String imagePath) {
    return Stack(
      //alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: 80,
          width: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget scrollCard(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(imagePath, height: 90, width: 80, fit: BoxFit.cover),
    );
  }

  Widget bigDealCard(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(imagePath, height: 150, width: 300, fit: BoxFit.fill),
    );
  }

  Widget greatOffers(String imagePath) {
    return Stack(
      children: [
        Container(
          height: 80,
          width: 90,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
  Widget finalItems (String imagePath) {
    return Stack(
      alignment: AlignmentGeometry.bottomCenter,
      children: [
        Container(
          height: 166,
          width: 145,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(image: AssetImage(imagePath),
            fit: BoxFit.cover
            )
          ),
        )
      ],
    );

  }
}
