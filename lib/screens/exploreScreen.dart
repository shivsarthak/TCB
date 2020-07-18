import 'package:flutter/material.dart';
import 'package:thecollegebee/widgets/categoriesCard.dart';
import 'package:thecollegebee/widgets/eventDetailsCard.dart';

import 'package:thecollegebee/widgets/searchBar.dart';

class ExploreScreen extends StatefulWidget {
  @override
  _ExploreScreenState createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: new BoxDecoration(
            gradient: new LinearGradient(
                colors: [
                  const Color(0xFFFFD345),
                  const Color(0xFFFF7777),
                ],
                begin: FractionalOffset(-0.9, 0.2),
                end: FractionalOffset(1.1, 0.6),
                tileMode: TileMode.clamp),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SafeArea(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Scaffold.of(context).openDrawer();
                        },
                        child: Icon(
                          Icons.menu,
                          size: 22,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 12),
                      Text(
                        "Explore",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 21),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: SearchBar(),
                ),
                SizedBox(height: 12),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25)),
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            SizedBox(height: 25),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "Explore By Categories",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff838383),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 4.0),
                              child: SizedBox(
                                height: 180,
                                child: ListView(
                                  padding:
                                      EdgeInsets.only(top: 10.0, bottom: 10.0),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.horizontal,
                                  children: <Widget>[
                                    CategoriesCard(color: Color(0xffFFBF84)),
                                    CategoriesCard(color: Color(0xffFFA8A8)),
                                    CategoriesCard(color: Color(0xffFFBF84)),
                                    CategoriesCard(color: Color(0xffFFA8A8)),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                "Upcoming Events",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff838383),
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(height: 4),
                            for (int i in [1, 2, 3, 4])
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 8.0, vertical: 4.0),
                                child: EventDetailsCard(),
                              )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
