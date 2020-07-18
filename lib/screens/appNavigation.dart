import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thecollegebee/screens/announcementScreen.dart';
import 'package:thecollegebee/screens/exploreScreen.dart';
import 'package:thecollegebee/screens/likedScreen.dart';
import 'package:thecollegebee/screens/objects/user.dart';
import 'package:thecollegebee/screens/profileScreen.dart';
import 'package:thecollegebee/services/databaseService.dart';
import 'package:thecollegebee/widgets/customDrawer.dart';

import 'homeScreen.dart';

class AppNavigation extends StatefulWidget {
  @override
  _AppNavigationState createState() => _AppNavigationState();
}

class _AppNavigationState extends State<AppNavigation> {
  Widget screen = HomeScreen();
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    var user = (Provider.of<FirebaseUser>(context));
    return StreamBuilder<DocumentSnapshot>(
        stream: DatabaseService()
            .userDataStream(uid: (user != null) ? user.uid : "0"),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Scaffold(
              body: CircularProgressIndicator(),
            );
          if (!snapshot.data.exists)
            return ProfileScreen(firstTimeSetup: true);
          else
            return Provider.value(
              value: User.fromJSON(snapshot.data.data),
              child: Scaffold(
                drawer: CustomDrawer(),
                body: AnimatedSwitcher(
                  duration: Duration(milliseconds: 300),
                  child: screen,
                ),
                bottomNavigationBar: BottomNavigationBar(
                  currentIndex: _index,
                  onTap: (value) {
                    _index = value;
                    setState(() {
                      switch (value) {
                        case 0:
                          screen = HomeScreen();
                          break;
                        case 1:
                          screen = ExploreScreen();
                          break;
                        case 2:
                          screen = LikedScreen();
                          break;
                        case 3:
                          screen = AnnouncementScreen();
                          break;
                      }
                    });
                  },
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.home,
                          color: Colors.grey,
                        ),
                        title: Text(
                          "Home",
                          style: TextStyle(color: Colors.grey),
                        )),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.explore,
                          color: Colors.grey,
                        ),
                        title: Text(
                          "Explore",
                          style: TextStyle(color: Colors.grey),
                        )),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.grey,
                        ),
                        title: Text(
                          "Liked",
                          style: TextStyle(color: Colors.grey),
                        )),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.announcement,
                          color: Colors.grey,
                        ),
                        title: Text(
                          "Announcements",
                          style: TextStyle(color: Colors.grey),
                        )),
                  ],
                ),
              ),
            );
        });
  }
}
