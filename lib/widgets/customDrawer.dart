import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thecollegebee/screens/eventListPage.dart';
import 'package:thecollegebee/screens/objects/user.dart';
import 'package:thecollegebee/screens/profileScreen.dart';
import 'package:thecollegebee/services/authenticationService.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    User user = Provider.of<User>(context);
    return Drawer(
        child: Column(
      children: <Widget>[
        UserAccountsDrawerHeader(
          accountName: Text("${user.firstName} ${user.lastName}"),
          accountEmail: Text("${user.college}"),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EventListPage(
                      title: "Your Interested Events",
                    )));
          },
          title: Text("Your Interested Events"),
          leading: Icon(
            Icons.event,
            color: Colors.black,
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EventListPage(
                      title: "Your Event History",
                    )));
          },
          title: Text("Event History"),
          leading: Icon(
            Icons.history,
            color: Colors.black,
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProfileScreen(
                      firstTimeSetup: false,
                      user: user,
                    )));
          },
          title: Text("Profile"),
          leading: Icon(
            Icons.person_outline,
            color: Colors.black,
          ),
        ),
        ListTile(
          title: Text("Feedback"),
          leading: Icon(
            Icons.feedback,
            color: Colors.black,
          ),
        ),
        ListTile(
          title: Text("About"),
          leading: Icon(
            Icons.info_outline,
            color: Colors.black,
          ),
        ),
        ListTile(
          onTap: () async {
            await AuthenticationService().logout();
          },
          title: Text("Log Out"),
          leading: Icon(
            Icons.exit_to_app,
            color: Colors.black,
          ),
        ),
      ],
    ));
  }
}
