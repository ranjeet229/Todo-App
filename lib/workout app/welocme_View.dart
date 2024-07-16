import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/workout%20app/Home_VIew.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  final List levels = [
    "Inactive",
    "Beginner",
    "Advanced",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/w7.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 70),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HARD",
                      style: GoogleFonts.bebasNeue(
                        fontSize: 32,
                        color: Colors.white,
                        letterSpacing: 1.0,
                      ),
                    ),
                    SizedBox(width: 6.0),
                    Text(
                      "ELEMENT",
                      style: GoogleFonts.bebasNeue(
                        fontSize: 32,
                        color: Color(0xFF40D876),
                        letterSpacing: 1.8,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About You",
                    style: GoogleFonts.lato(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "We want to know about your workout preferences...\nplease follow the steps.",
                    style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 40),
                  Container(
                    height: 226,
                    width: double.infinity,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: levels.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Container(
                            height: 226,
                            width: 195,
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: Color(0xFF40D876),
                                width: 2.0,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "I am",
                                    style: GoogleFonts.lato(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    levels[index],
                                    style: GoogleFonts.lato(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFF40D876),
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    index == 0
                                        ? "I have never trained"
                                        : index == 1
                                        ? "I train occasionally"
                                        : "I train regularly",
                                    style: GoogleFonts.lato(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 40.0,top: 40,bottom: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Skip Intro",
                          style: GoogleFonts.lato(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.white30,
                          ),
                        ),
                        GestureDetector(
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context)=> HomeView()));
                          },
                          child: Container(
                            width: 139,
                            height: 39,
                            decoration: BoxDecoration(
                              color: Color(0xFF04D876),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Center(
                              child: Text(
                                "Next",
                                style: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
