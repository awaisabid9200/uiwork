import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Model/ModelClass.dart';
import '../Model/Product_Data.dart';
import 'Widget/Colours.dart';
import 'Widget/CustomList.dart';
import 'Widget/NavBar.dart';
import 'Widget/Widget.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isClicked = false;
  final List<DummyData> allDummyData = generateDummyData();
  List<DummyData> filteredDummyData = [];

  @override
  void initState() {
    super.initState();
    filteredDummyData = allDummyData;
  }

  void handleSearch(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredDummyData = allDummyData;
      } else {
        filteredDummyData = allDummyData.where((item) {
          return item.title.toLowerCase().contains(query.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backLight,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backLight,
        title: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/w.png',
                      height: 26,
                      width: 26,
                    ),
                    Text(
                      'ilsco',
                      style: GoogleFonts.oxygen(
                        fontWeight: FontWeight.w600,
                        fontSize: 26,
                        color: Colors.amber,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Wilsco Own other Brands Like Smilwale',
                  style: TextStyle(
                    color: textBlack,
                    fontSize: 12,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      drawer: MyDrawer(),
      body: Stack(
        children: [
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    SearchScreen(
                      onSearchTextChanged: handleSearch,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Category',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: textBlack,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04),
                        ),
                        Text(
                          'See All',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: textBlack,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.03),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    wilscoBrandIcons(),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Most Popular',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: textBlack,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.04),
                        ),
                        Text(
                          'See All',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: textBlack,
                              fontSize:
                                  MediaQuery.of(context).size.width * 0.03),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomListView(),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
