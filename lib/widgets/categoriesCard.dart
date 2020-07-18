import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thecollegebee/screens/eventListPage.dart';
import 'package:thecollegebee/screens/objects/user.dart';

class CategoriesCard extends StatelessWidget {
  final Color color;
  CategoriesCard({this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EventListPage(
                  title: "Categories Page",
                )));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 3.0),
        child: Container(
          height: 170,
          width: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: color),
        ),
      ),
    );
  }
}
