import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Color(0xffDDDDDD),
        ),
      ),
      child: TextFormField(
        decoration: InputDecoration(
            icon: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.0),
              child: Icon(
                Icons.search,
                color: Color(0xffC4C4C4),
              ),
            ),
            border: InputBorder.none,
            hintText: "Search an Event",
            hintStyle: TextStyle(color: Color(0xffC4C4C4))),
      ),
    );
  }
}
