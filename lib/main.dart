import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uiwork/UI/Widget/Colours.dart';
import 'UI/MedicalList.dart';
import 'UI/SplachScreen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme:  AppBarTheme(
        backgroundColor: lightblack),
        textTheme: GoogleFonts.playTextTheme(
          Theme.of(context).textTheme),
      ),
      home: SplashScreen(),
      initialRoute: '/',
      routes: {
        '/home':(context)=>MedicalList(),
        '/fitness':(context)=>MedicalList(),
        '/medical':(context)=>MedicalList(),
      },
    );
  }
}

