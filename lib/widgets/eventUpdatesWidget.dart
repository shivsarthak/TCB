import 'package:flutter/material.dart';

class EventUpdatesWidget extends StatefulWidget {
  EventUpdatesWidget({Key key}) : super(key: key);

  @override
  _EventUpdatesWidgetState createState() => _EventUpdatesWidgetState();
}

class _EventUpdatesWidgetState extends State<EventUpdatesWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "No Updates",
                      style: TextStyle(fontSize: 14, color: Color(0xffFFD758)),
                    ),
                    Text(
                      "You dont have any new updates",
                      style: TextStyle(fontSize: 12, color: Color(0xffA5A5A5)),
                    ),
                  ],
                ),
          Image.asset("assets/illustrations/no_updates.png",height:150)
        ],
      )),
    );
  }
}
