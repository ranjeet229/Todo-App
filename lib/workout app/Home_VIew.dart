import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/workout%20app/description.dart';
import 'package:todo_app/workout%20app/welocme_View.dart';

import '../model/category.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final List<Category> categoryList = [
    Category(
      imageUrl: "assets/images/w5.jpg",
      name: "Yoga Exercise",
    ),
    Category(
      imageUrl: "assets/images/w2.jpg",
      name: "Pullup Exercise",
    ),
    Category(
      imageUrl: "assets/images/w6.jpg",
      name: "Biceps Exercise",
    ),
    Category(
      imageUrl: "assets/images/w3.jpg",
      name: "Pushup Exercise",
    ),
    Category(
      imageUrl: "assets/images/w2.jpg",
      name: "Pullup Exercise",
    ),
    Category(
      imageUrl: "assets/images/w6.jpg",
      name: "Biceps Exercise",
    ),
  ];

  int _currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });

    // Add navigation logic here
    // For example:
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WelcomeView()),
      );
    }
    if(index == 2){
      Navigator.push(
          context,
        MaterialPageRoute(builder: (context)=> DescriptionPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/w9.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "Hey",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 32,
                      color: Colors.white,
                      letterSpacing: 1.8,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "ALEX",
                    style: GoogleFonts.lato(
                      fontSize: 32,
                      color: Color(0xFF40D876),
                      letterSpacing: 1.8,
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(
                        width: 2,
                        color: Color(0xFF40D876),
                      ),
                      image: DecorationImage(
                        image: AssetImage("assets/images/w5.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 50),
              Center(
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(40.0),
                  ),
                  child: Center(
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        color: Color(0xFF40D876),
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.play_arrow,
                          size: 40,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Find",
                        style: GoogleFonts.lato(
                          fontSize: 26,
                          color: Color(0xFF40D876),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 4),
                      Text(
                        "your Workout",
                        style: GoogleFonts.lato(
                          fontSize: 26,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Icon(
                    Icons.filter_alt_outlined,
                    size: 40,
                    color: Colors.white,
                  ),
                ],
              ),
              SizedBox(height: 20),
              Container(
                width: 353,
                height: 46,
                decoration: BoxDecoration(
                  color: Color(0xFF232441),
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "SEARCH WORKOUT",
                      hintStyle: TextStyle(
                        color: Colors.white54,
                      ),
                      border: InputBorder.none,
                      icon: Icon(
                        Icons.search,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Color(0xFF40D876),
                          width: 2,
                        ),
                      ),
                      child: Text(
                        "Popular",
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Color(0xFF40D876),
                          width: 2,
                        ),
                      ),
                      child: Text(
                        "Hard Workout",
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Color(0xFF40D876),
                          width: 2,
                        ),
                      ),
                      child: Text(
                        "Full body",
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                          color: Color(0xFF40D876),
                          width: 2,
                        ),
                      ),
                      child: Text(
                        "Crossfit",
                        style: GoogleFonts.lato(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: categoryList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: [
                          Container(
                            height: 172,
                            width: 141,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(categoryList[index].imageUrl),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            categoryList[index].name,
                            style: GoogleFonts.lato(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        backgroundColor: Color(0xff232441),
        unselectedItemColor: Colors.white54,
        selectedItemColor: Color(0xff40d876),
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_gymnastics_sharp),
            label: "Workout",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.line_axis),
            label: "Levels",
          ),
        ],
      ),
    );
  }
}
