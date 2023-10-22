import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'Colours.dart';

// wilsco brand icons //

class wilscoBrandIcons extends StatelessWidget {
  final List<Map<String, dynamic>> wilscoBrands = [
    {'icon': FontAwesomeIcons.house, 'name': 'Home', 'route': '/home'},
    {'icon': FontAwesomeIcons.dumbbell, 'name': 'Fitness', 'route': '/fitness'},
    {'icon': FontAwesomeIcons.houseChimneyMedical, 'name': 'Medical', 'route': '/medical'},
  ];

  @override
  Widget build(BuildContext context) {
    double iconSize = MediaQuery.of(context).size.width * 0.04;
    double textSize = MediaQuery.of(context).size.width * 0.029;

    return Wrap(
      spacing: 10, // Spacing between items horizontally
      runSpacing: 8, // Spacing between rows vertically
      children: wilscoBrands.map((brand) {
        return GestureDetector(
          onTap: () {
            // Navigate to the specified route when clicked
            Navigator.of(context).pushNamed(brand['route'],arguments: brand['name']);
          },
          child: Container(
            width: MediaQuery.sizeOf(context).width*0.2,
            height: MediaQuery.sizeOf(context).width*0.1,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FaIcon(
                  brand['icon'],
                  size: iconSize,
                  color: lightblack,
                ),
                Text(
                  brand['name'],
                  maxLines: 1,
                  style: TextStyle(fontSize: textSize, fontWeight: FontWeight.w600,color: textBlack),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}


// end 2 //


// search screen //
class SearchScreen extends StatefulWidget {
  final Function(String) onSearchTextChanged;

  SearchScreen({required this.onSearchTextChanged});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged() {
    widget.onSearchTextChanged(_searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    double iconSize = MediaQuery.of(context).size.width * 0.06; // Adjust icon size based on screen width
    double textFieldHeight = MediaQuery.of(context).size.width * 0.12; // Adjust text field height based on screen width
    double hintFontSize = MediaQuery.of(context).size.width * 0.035; // Adjust hint font size based on screen width
    double labelFontSize = MediaQuery.of(context).size.width * 0.03; // Adjust label font size based on screen width

    return Column(
      children: [
        SizedBox(height: 10),
        Container(
          height: textFieldHeight,
          child: TextField(
            cursorColor: textlight,
            controller: _searchController,
            decoration: InputDecoration(
              labelStyle: TextStyle(color: textlight, fontWeight: FontWeight.w300, fontSize: labelFontSize),
              hintText: 'Search',
              hintStyle: TextStyle(fontWeight: FontWeight.w300, fontSize: hintFontSize),
              prefixIcon: Icon(Icons.search, color: textlight, size: iconSize),
              suffixIcon: Icon(Icons.filter_list, color: textlight, size: iconSize),
              fillColor: Colors.white, // Gray background color
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

// end 5

// -- common style -- //

// Define a constant TextStyle
const TextStyle commonTextStyle = TextStyle(
  fontSize: 16, // Adjust the font size as needed
  fontWeight: FontWeight.w500, // Adjust the font weight as needed
  color: Color(0xff26222a), // Adjust the text color as needed
);

