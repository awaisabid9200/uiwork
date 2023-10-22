import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Colours.dart';
import 'Widget.dart';

class MyDrawer extends StatefulWidget {
  @override
  _MyDrawerState createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor:backLight,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.sizeOf(context).height*0.3,
              padding: EdgeInsets.only(left: 15),
              width: double.infinity,
              color: lightblack,
              child:     Row(
                children: [
                  Image.asset(
                    'assets/W.png',
                    height: 62,
                    width: 62,
                  ),
                  Text(
                    'ilsco',
                    style: GoogleFonts.oxygen(
                      fontWeight: FontWeight.w700,
                      fontSize: 42,
                      color: Colors.white,
                      letterSpacing: 5,
                    ),
                  ),
                ],
              ),
            ),

            // Wrap your list items in ExpansionTile widgets
            ExpansionTile(
              backgroundColor:backLight,
              leading: FaIcon(
                FontAwesomeIcons.barsProgress,
                size: 20,
                color:lightblack,
              ),
              title: Text('Category',style: commonTextStyle,),
              children: [
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.houseChimneyMedical,
                    size: 20,
                    color:lightblack,
                  ),
                  title: Text('Medical',style: commonTextStyle,),
                  onTap: () {
                    Navigator.pushNamed(context, '/medical',arguments: 'Medical');
                  },
                ),
                ListTile(
                  leading: FaIcon(
                    FontAwesomeIcons.house,
                    size: 20,
                    color:lightblack,
                  ),
                  title: Text('Home & Kitchen',style: commonTextStyle,),
                  onTap: () {
                    Navigator.pushNamed(context, '/home',arguments: 'Home & Kitchen');
                  },
                ),
                ListTile(
                  leading:FaIcon(
                    FontAwesomeIcons.dumbbell,
                    size: 20,
                    color:lightblack,
                  ),
                  title: Text('Fitness',style: commonTextStyle,),
                  onTap: () {
                    Navigator.pushNamed(context, '/fitness',arguments: 'Fitness');
                  },
                ),
              ],
            ),
            ExpansionTile(
              backgroundColor:backLight,
              leading: Icon(FontAwesomeIcons.creditCard,size: 20,color: lightblack,),
              title: Text('Payment Methods',style: commonTextStyle,),
              children: [
                ListTile(
                  leading: Icon(FontAwesomeIcons.paypal,size: 20,color: lightblack,),
                  title: Text('Paypal',style: commonTextStyle,),
                  onTap: () {
                    print('Pressed');
                  },
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.amazonPay,size: 20,color: lightblack,),
                  title: Text('AmazonPay',style: commonTextStyle,),
                  onTap: () {
                    print('Pressed');
                  },
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.wallet,size: 20,color: lightblack,),
                  title: Text('Wallet',style: commonTextStyle,),
                  onTap: () {
                    print('Pressed');
                  },
                ),
              ],
            ),
            ExpansionTile(
              backgroundColor:backLight,
              leading: Icon(FontAwesomeIcons.solidMessage,size: 20,color: lightblack,),
              title: Text('Feedback',style: commonTextStyle,),
              children: [
                ListTile(
                  leading: Icon(FontAwesomeIcons.star,size: 20,color: lightblack,),
                  title: Text('Rate Us',style: commonTextStyle,),
                  onTap: () {
                    print('Pressed');
                  },
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.commentDots,size: 20,color: lightblack,),
                  title: Text('Leave a Comment',style: commonTextStyle,),
                  onTap: () {
                    print('Pressed');
                  },
                ),
              ],
            ),
            ExpansionTile(
              backgroundColor:backLight,
              leading: Icon(FontAwesomeIcons.gear,size: 20,color: lightblack,),
              title: Text('Setting',style: commonTextStyle,),
              children: [
                ListTile(
                  leading: Icon(FontAwesomeIcons.language,size: 20,color: lightblack,),
                  title: Text('Language',style: commonTextStyle,),
                  onTap: () {
                    print('Pressed');
                  },
                ),
                ListTile(
                  leading: Icon(FontAwesomeIcons.shield,size: 20,color: lightblack,),
                  title: Text('Security',style: commonTextStyle,),
                  onTap: () {
                    print('Pressed');
                  },
                ),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ListTile(
                  leading: Icon(FontAwesomeIcons.xmark,size: 20,color: lightblack,),
                  title: Text('Close',style: commonTextStyle,),
                  onTap: () {
                    Navigator.of(context).pop();
                    print('Pressed');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
