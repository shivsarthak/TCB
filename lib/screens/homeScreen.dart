import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thecollegebee/screens/objects/user.dart';
import 'package:thecollegebee/widgets/eventUpdatesWidget.dart';
import 'package:thecollegebee/widgets/reccomendedEventCard.dart';
import 'package:thecollegebee/widgets/searchBar.dart';
import 'package:thecollegebee/widgets/upcomingEventCard.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);

    return Scaffold(
      backgroundColor: Color(0xffF8F8F8),
      body: Stack(
        children: <Widget>[
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
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
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: CustomScrollView(slivers: [
              SliverAppBar(
                elevation: 0,
                forceElevated: false,
                backgroundColor: Colors.transparent,
                leading: IconButton(
                    icon: Icon(
                      Icons.menu,
                      size: 22,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    }),
                title: Text(
                  "TheCollegeBee",
                  style: TextStyle(
                      shadows: [
                        Shadow(
                            color: Colors.black12,
                            blurRadius: 5,
                            offset: Offset(0, 4)),
                      ],
                      fontWeight: FontWeight.w600,
                      fontSize: 21,
                      color: Colors.white),
                ),
                centerTitle: true,
                actions: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Icon(
                      Icons.notifications,
                      size: 22,
                      color: Colors.white,
                    ),
                  )
                ],
                floating: true,
              ),
              SliverFillRemaining(
                hasScrollBody: false,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25))),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 24),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.0),
                        child: Text(
                          "Hi ${user.firstName},",
                          style: TextStyle(
                              shadows: [
                                Shadow(
                                    color: Colors.black12,
                                    blurRadius: 5,
                                    offset: Offset(0, 4)),
                              ],
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                      SizedBox(height: 12),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.0),
                        child: Text(
                          "Featured Events",
                          style: TextStyle(
                              shadows: [
                                Shadow(
                                    color: Colors.black12,
                                    blurRadius: 5,
                                    offset: Offset(2, 4)),
                              ],
                              fontSize: 14,
                              color: Colors.white,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                      SizedBox(
                        height: 282,
                        child: ListView(
                          padding:
                              EdgeInsets.only(top: 10.0, bottom: 10.0, left: 8),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            ReccomendedEventCard(),
                            ReccomendedEventCard(),
                            ReccomendedEventCard(),
                            ReccomendedEventCard(),
                          ],
                        ),
                      ),
                      SizedBox(height: 24),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.0),
                        child: Text(
                          "Your Upcoming Events",
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff4A4A4A),
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.0),
                        child: UpcomingEventCard(),
                      ),
                      SizedBox(height: 12),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 14.0),
                        child: Text(
                          "Event Updates",
                          style: TextStyle(
                              fontSize: 14,
                              color: Color(0xff4A4A4A),
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(height: 12),
                      EventUpdatesWidget(),
                      SizedBox(height: 12),
                      SizedBox(height: 12),
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
