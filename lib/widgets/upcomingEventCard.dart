import 'package:flutter/material.dart';

class UpcomingEventCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: MediaQuery.of(context).size.width * 87,
      margin: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 4),
            blurRadius: 6,
            spreadRadius: 0,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Stack(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Image.asset(
                "assets/illustrations/no_data_found.png",
                height: 170,
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: 200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "No Events Found",
                      style: TextStyle(fontSize: 14, color: Color(0xffFFD758)),
                    ),
                    Text(
                      "Tap to explore new upcoming events",
                      style: TextStyle(fontSize: 12, color: Color(0xffA5A5A5)),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
