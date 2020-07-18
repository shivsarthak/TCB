import 'package:flutter/material.dart';
import 'package:thecollegebee/widgets/eventDetailsCard.dart';

import 'package:thecollegebee/widgets/searchBar.dart';


class EventListPage extends StatefulWidget {
  final String title;

  const EventListPage({Key key, this.title}) : super(key: key);
  @override
  _EventListPageState createState() => _EventListPageState();
}

class _EventListPageState extends State<EventListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        title: Text(
          "${widget.title}",
          style: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 18, color: Colors.black),
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Color(0xffF8F8F8),
      ),
      backgroundColor: Color(0xffF8F8F8),
      body: CustomScrollView(slivers: [
        SliverAppBar(
          automaticallyImplyLeading: false,
          title: SearchBar(),
          centerTitle: false,
          elevation: 0,
          backgroundColor: Color(0xffF8F8F8),
          floating: true,
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          child: Column(
            children: <Widget>[
              for (int i = 0; i < 20; i++)
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: EventDetailsCard(),
                )
            ],
          ),
        ),
      ]),
    );
  }
}
