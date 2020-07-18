import 'package:flutter/material.dart';
import 'package:thecollegebee/widgets/categoriesCard.dart';

class EventScreen extends StatefulWidget {
  @override
  _EventScreenState createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: 700,
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
           SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal:16.0),
                          child: Column(
                            children: <Widget>[
                              SizedBox(height:12),
                              Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(
                                    Icons.arrow_back,
                                    size: 22,
                                    color: Colors.white,
                                  ),
                                ),
                                Icon(
                                  Icons.share,
                                  color: Colors.white,
                                ),
                              ],
                      ),
                            ],
                          ),
                        ),
           ),
          SafeArea(
                      child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: MediaQuery.of(context).size.height*0.32 ,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 24),
                    Row(
                      children: <Widget>[
                        CategoriesCard(
                          color: Colors.grey,
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Cyber Chotu Marathon",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white),
                            ),
                            Text(
                              "Engineers Without Borders",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white),
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.date_range,
                                  color: Colors.white,
                                  size: 18,
                                ),
                                Text(
                                  "12 March , 4:30pm",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.pin_drop,
                                  color: Colors.white,
                                  size: 18,
                                ),
                                Text(
                                  "The Northcap University",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
              ),
            ),
          ),
          Column(
            children: <Widget>[
            
              Expanded(
                child: DraggableScrollableSheet(
                  initialChildSize: 0.65,
                  minChildSize: 0.65,
                  maxChildSize: 1,
                    builder: (context, scrollController) {
                  return Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SingleChildScrollView(
                        
                        controller: scrollController,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 20),
                              Text(
                                "About Event",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Diam scelerisque tortor diam rhoncus urna, lobortis interdum. Aliquet praesent est, netus adipiscing. A neque diam auctor donec maecenas. Sagittis diam, non donec tempor in. Nisl, hendrerit at id vestibulum, erat. Vestibulum, ornare sed nunc magna quis scelerisque ullamcorper nulla justo. Quis nibh vitae mi vitae. Aenean pretium porta viverra rhoncus nulla ultrices sit neque. Netus risus habitant viverra vitae mi, auctor facilisi.Scelerisque cursus pulvinar nec eget. Orci ut amet habitant auctor ultricies a est sed tincidunt. Lacinia elit, quam morbi curabitur. Feugiat et egestas euismod feugiat in. Id vel, aenean diam at habitant pulvinar.",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff737373)),
                              ),
                              Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Diam scelerisque tortor diam rhoncus urna, lobortis interdum. Aliquet praesent est, netus adipiscing. A neque diam auctor donec maecenas. Sagittis diam, non donec tempor in. Nisl, hendrerit at id vestibulum, erat. Vestibulum, ornare sed nunc magna quis scelerisque ullamcorper nulla justo. Quis nibh vitae mi vitae. Aenean pretium porta viverra rhoncus nulla ultrices sit neque. Netus risus habitant viverra vitae mi, auctor facilisi.Scelerisque cursus pulvinar nec eget. Orci ut amet habitant auctor ultricies a est sed tincidunt. Lacinia elit, quam morbi curabitur. Feugiat et egestas euismod feugiat in. Id vel, aenean diam at habitant pulvinar.",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff737373)),
                              ),
                              Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Diam scelerisque tortor diam rhoncus urna, lobortis interdum. Aliquet praesent est, netus adipiscing. A neque diam auctor donec maecenas. Sagittis diam, non donec tempor in. Nisl, hendrerit at id vestibulum, erat. Vestibulum, ornare sed nunc magna quis scelerisque ullamcorper nulla justo. Quis nibh vitae mi vitae. Aenean pretium porta viverra rhoncus nulla ultrices sit neque. Netus risus habitant viverra vitae mi, auctor facilisi.Scelerisque cursus pulvinar nec eget. Orci ut amet habitant auctor ultricies a est sed tincidunt. Lacinia elit, quam morbi curabitur. Feugiat et egestas euismod feugiat in. Id vel, aenean diam at habitant pulvinar.",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff737373)),
                              ),
                              Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Diam scelerisque tortor diam rhoncus urna, lobortis interdum. Aliquet praesent est, netus adipiscing. A neque diam auctor donec maecenas. Sagittis diam, non donec tempor in. Nisl, hendrerit at id vestibulum, erat. Vestibulum, ornare sed nunc magna quis scelerisque ullamcorper nulla justo. Quis nibh vitae mi vitae. Aenean pretium porta viverra rhoncus nulla ultrices sit neque. Netus risus habitant viverra vitae mi, auctor facilisi.Scelerisque cursus pulvinar nec eget. Orci ut amet habitant auctor ultricies a est sed tincidunt. Lacinia elit, quam morbi curabitur. Feugiat et egestas euismod feugiat in. Id vel, aenean diam at habitant pulvinar.",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xff737373)),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "Links",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                              SizedBox(height: 12),
                              Text(
                                "Contacts",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black),
                              ),
                            ]),
                      ),
                    ),
                  );
                }),
              )
            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 42.0),
                child: Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                      color: Color(0xffFF9268),
                      borderRadius: BorderRadius.circular(10)),
                  child: Center(
                      child: Text(
                    "Enroll In Event",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  )),
                ),
              ))
        ],
      ),
    );
  }
}
