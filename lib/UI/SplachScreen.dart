import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uiwork/UI/HomeScreen.dart';

import 'Widget/Colours.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Add any initialization logic here (e.g., loading data).

    // Simulate a delay to show the splash screen for a few seconds.
    Future.delayed(Duration(milliseconds: 800), () {
      // Navigate to the next screen (e.g., your home screen).
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightblack,
      body: Stack(
        children: [
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/W.png',height: 60,width: 60,),
                Text(
                  'ilsco',
                  style: GoogleFonts.oxygen(
                    fontWeight: FontWeight.w700,
                    fontSize: 42,
                    color: Colors.amber,
                    letterSpacing: 5,
                  ),
                ),

              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                'Wilsco Own others Brands Like Smillwala',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
