import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../Model/ModelClass.dart';
import '../Model/Product_Data.dart';
import 'Widget/Colours.dart';
import 'Detail_screen.dart';

class MedicalList extends StatefulWidget {
  @override
  _MedicalListState createState() => _MedicalListState();
}

class _MedicalListState extends State<MedicalList> {
  List<DummyData> allDummyData = MedicalDummyData();
  List<DummyData> filteredDummyData = [];


  @override
  void initState() {
    super.initState();
    filteredDummyData = allDummyData;
  }

  void handleSearch(String query) {
    setState(() {
      filteredDummyData = allDummyData.where((item) {
        return item.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get the current screen size and orientation
    final mediaQuery = MediaQuery.of(context);
    final screenSize = mediaQuery.size.width;
    final String itemName = ModalRoute.of(context)?.settings.arguments as String;
    return Scaffold(
      backgroundColor: backLight,
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        title: Text(itemName,style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(
            icon: Icon(Icons.search,color: Colors.white,),
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(allDummyData),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView( // Wrap your ListView in SingleChildScrollView
        child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: filteredDummyData.length,
          itemBuilder: (context, index) {
            final dummyData = filteredDummyData[index];
            return Container(
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade400,
                    blurRadius: 7,
                    spreadRadius: 0,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          offset: Offset(0, 2),
                          blurRadius: 5,
                          spreadRadius: 0,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset(
                        dummyData.imageUrl,
                        width: screenSize * 0.3, // Adjust image width based on screen size
                        height: screenSize*0.3,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            dummyData.subtitle,
                            maxLines: 2,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: textBlack,
                              fontSize: screenSize < 600 ? 14 : 16, // Adjust font size based on screen size
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            dummyData.title,
                            style: TextStyle(fontSize: 13, color:textlight),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  RatingBar.builder(
                                    initialRating: dummyData.rating,
                                    minRating: 1,
                                    direction: Axis.horizontal,
                                    allowHalfRating: true,
                                    itemCount: 5,
                                    itemSize: 14,
                                    itemPadding: EdgeInsets.symmetric(
                                        horizontal: 1.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating);
                                    },
                                  )
                                ],
                              ),
                              Container(
                                height: 30,
                                width: 90,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: lightblack,
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(25),
                                      bottomRight: Radius.circular(25),
                                      topRight: Radius.circular(25)),
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            DetailScreen(
                                                dummyData: dummyData),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    dummyData.backgroundText,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {
  final List<DummyData> allDummyData;

  CustomSearchDelegate(this.allDummyData);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text('Search Results for: $query'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty
        ? []
        : allDummyData.where((item) {
      return item.title.toLowerCase().contains(query.toLowerCase());
    }).toList();

    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        final suggestion = suggestionList[index];
        return ListTile(
          title: Text(suggestion.title),
          onTap: () {
            close(context, suggestion.title);
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailScreen(dummyData: suggestion),
              ),
            );
          },
        );
      },
    );
  }
}
