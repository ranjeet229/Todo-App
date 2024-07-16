import 'package:flutter/material.dart';
import 'package:todo_app/workout%20app/welcome_view.dart';
import 'dart:async';

import '../workout app/welocme_View.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 3),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeOut);

    _controller.forward();

    Timer(Duration(seconds: 4), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => WelcomeView()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                scale: _animation,
                child: Material(
                  elevation: 5,
                  shape: CircleBorder(),
                  child: CircleAvatar(
                    radius: 75, // 150/2
                    backgroundImage: AssetImage('assets/images/w5.jpg'),
                  ),
                ),
              ),
              SizedBox(height: 20),
              FadeTransition(
                opacity: _animation,
                child: Column(
                  children: [
                    Text(
                      'FitFlare',
                      style: TextStyle(
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Ignite Your Fitness Journey',
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
