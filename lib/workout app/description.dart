import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/workout%20app/Home_VIew.dart';

class DescriptionPage extends StatefulWidget {
  const DescriptionPage({Key? key});

  @override
  State<DescriptionPage> createState() => _DescriptionPageState();
}

enum TabItem { description, feedback, related }

class _DescriptionPageState extends State<DescriptionPage> {
  TabItem selectedTab = TabItem.description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/w8.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20), // Adjust spacing as needed
              Padding(
                padding: const EdgeInsets.all(22.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      width: 140,
                      decoration: BoxDecoration(
                        color: Color(0xff40d876),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Center(
                        child: Text(
                          "3 hours",
                          style: GoogleFonts.bebasNeue(
                            color: Colors.white,
                            fontSize: 16,
                            fontStyle: FontStyle.normal,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeView()));
                      },
                      child: Icon(
                        Icons.dangerous_outlined,
                        color: Colors.white,
                        size: 40,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 40), // Adjust spacing as needed
              Padding(
                padding: const EdgeInsets.only(top: 120.0),
                child: Container(
                  width: 340,
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(26.0),
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "18",
                              style: GoogleFonts.bebasNeue(
                                fontSize: 24,
                                color: Color(0xFF40D876),
                                letterSpacing: 1.0,
                              ),
                            ),
                          ),
                          SizedBox(width: 6.0),
                          Text(
                            "moves",
                            style: GoogleFonts.bebasNeue(
                              fontSize: 16,
                              color: Colors.white,
                              letterSpacing: 1.8,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "12",
                            style: GoogleFonts.bebasNeue(
                              fontSize: 24,
                              color: Color(0xFF40D876),
                              letterSpacing: 1.0,
                            ),
                          ),
                          SizedBox(width: 6.0),
                          Text(
                            "sets",
                            style: GoogleFonts.bebasNeue(
                              fontSize: 16,
                              color: Colors.white,
                              letterSpacing: 1.8,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "15",
                            style: GoogleFonts.bebasNeue(
                              fontSize: 24,
                              color: Color(0xFF40D876),
                              letterSpacing: 1.0,
                            ),
                          ),
                          SizedBox(width: 6.0),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              "min",
                              style: GoogleFonts.bebasNeue(
                                fontSize: 16,
                                color: Colors.white,
                                letterSpacing: 1.8,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Text "Advanced Workout"
              Text(
                "Advanced Workout",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 10),
              // Rating bar (using Flutter's default RatingBar)
              RatingBar.builder(
                initialRating: 4,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 30,
                unratedColor: Colors.white.withOpacity(0.3),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.yellowAccent,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
              SizedBox(height: 10,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTab = TabItem.description;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: Text(
                          "Description",
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            color: selectedTab == TabItem.description ? Colors.white : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTab = TabItem.feedback;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: Text(
                          "Feedback",
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            color: selectedTab == TabItem.feedback ? Colors.white : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 12),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedTab = TabItem.related;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        child: Text(
                          "Related",
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            color: selectedTab == TabItem.related ? Colors.white : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (selectedTab == TabItem.description) ...[
                SizedBox(height: 20),
                // Replace with your description content widget
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "FitFlex is your ultimate companion for fitness and workouts. Whether you're a beginner or a seasoned athlete, FitFlex helps you plan, track, and achieve your fitness goals with ease. From personalized workout routines to detailed progress tracking, stay motivated and reach new heights of fitness.",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
              if (selectedTab == TabItem.feedback) ...[
                SizedBox(height: 20),
                Text(
                  "Feedback ",
                  style: TextStyle(color: Colors.white),
                ),
              ],
              if (selectedTab == TabItem.related) ...[
                SizedBox(height: 20),
                Text(
                  "Related ",
                  style: TextStyle(color: Colors.white),
                ),
              ],
              SizedBox(height: 22),
              Container(
                width: 340,
                height: 58,
                decoration: BoxDecoration(
                  color: Color(0xFF04D876),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Center(
                  child: Text(
                    "Begin Train for Rs 10,000",
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Container(
                width: 340,
                height: 58,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Color(0xff40d876),
                  )
                ),
                child: Center(
                  child: Text(
                    "Begin Train Demo",
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
