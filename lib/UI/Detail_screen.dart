import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Model/ModelClass.dart';
import 'Widget/Colours.dart';

class DetailScreen extends StatelessWidget {
  final DummyData dummyData;

  DetailScreen({required this.dummyData});

  // Share function
  void shareArticle(DummyData dummyData) {
    Share.share('${dummyData.title}\n${dummyData.Urls}');
  }

  // URL launcher function
  Future openInApp({required String url, bool inApp = false}) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: true,
        forceWebView: true,
        enableJavaScript: true,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {

    final mediaQuery = MediaQuery.of(context);
    final height = mediaQuery.size.height;
    final textScaleFactor = mediaQuery.textScaleFactor;

    return Scaffold(
      backgroundColor: backLight,
      appBar: AppBar(
        leading: const BackButton(
          color: Colors.white,
        ),
        title: Text('Detail Screen', style: TextStyle(color: Colors.white)),
        actions: [
          IconButton(
            onPressed: () {
              shareArticle(dummyData);
            },
            icon: Icon(Icons.share, color: Colors.white),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Card(
                elevation: 5, // Customize the elevation as needed
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    height: height * 0.55,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(dummyData.imageUrl),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                ' ${dummyData.description}',
                style: TextStyle(
                  fontSize: 16 * textScaleFactor,
                  color:lightblack,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Divider(
                color: textlight,
                thickness: 2,
              ),
              Text(
                'About this item :',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w700,
                  color: textBlack,
                  fontSize: 16 * textScaleFactor,
                ),
              ),

              Text(
                dummyData.about,
                style: TextStyle(
                  color: textlight,
                  fontWeight: FontWeight.w600,
                  fontSize: 13 * textScaleFactor,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  openInApp(url: dummyData.Urls, inApp: true);
                },
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: lightblack,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Browse',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
