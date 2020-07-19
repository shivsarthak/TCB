import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:thecollegebee/screens/objects/user.dart';
import 'package:thecollegebee/services/authenticationService.dart';
import 'package:thecollegebee/services/databaseService.dart';

// ignore: must_be_immutable
class ProfileScreen extends StatefulWidget {
  final bool firstTimeSetup;
  var user;
  ProfileScreen({Key key, this.firstTimeSetup, this.user}) : super(key: key);
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  List<DropdownMenuItem<String>> items = [];
  final _formKey = GlobalKey<FormState>();
  void getcolleges() async {
    DatabaseService().getCollegeData().then((collegeData) {
      setState(() {
        items = collegeData.documents
            .map(
              (e) => DropdownMenuItem(
                value: e.documentID,
                child: Text(e.documentID),
              ),
            )
            .toList();
      });
    });
  }

  @override
  initState() {
    super.initState();
    getcolleges();
  }

  @override
  Widget build(BuildContext context) {
    print("Building");

    String firstName, lastName, college, rollNo;
    bool _autovalidate = false;
    if (widget.firstTimeSetup) {
      widget.user = Provider.of<FirebaseUser>(context, listen: false);
    } else
      college = widget.user.college;

    return Scaffold(
      body: Column(children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(40)),
            gradient: LinearGradient(
                colors: [
                  const Color(0xFFFFD345),
                  const Color(0xFFFF7777),
                ],
                begin: FractionalOffset(-0.9, 0.2),
                end: FractionalOffset(1.1, 0.6),
                tileMode: TileMode.clamp),
          ),
          child: SafeArea(
              child: Padding(
            padding: const EdgeInsets.only(left: 12.0, top: 12),
            child: Column(
              children: <Widget>[
                SizedBox(height: 12),
                Row(
                  children: <Widget>[
                    !widget.firstTimeSetup
                        ? GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(
                              Icons.arrow_back,
                              size: 22,
                              color: Colors.white,
                            ),
                          )
                        : SizedBox(),
                    widget.firstTimeSetup
                        ? GestureDetector(
                            onTap: () {
                              AuthenticationService().logout();
                            },
                            child: Icon(
                              Icons.arrow_back,
                              size: 22,
                              color: Colors.white,
                            ),
                          )
                        : SizedBox(),
                    SizedBox(width: 12),
                    Text(
                      widget.firstTimeSetup
                          ? "Setup Your Account"
                          : "Your Account",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 21),
                    ),
                  ],
                ),
                SizedBox(height: 12),
              ],
            ),
          )),
        ),
        Expanded(
          child: Form(
              key: _formKey,
              autovalidate: _autovalidate,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 8),
                      Center(
                          child: Icon(
                        Icons.account_circle,
                        size: 120,
                        color: Colors.grey,
                      )),
                      Center(
                          child: Text(
                              "${(widget.user != null) ? widget.user.email : "null"}")),
                      SizedBox(height: 12),
                      TextFormField(
                        initialValue: widget.firstTimeSetup
                            ? null
                            : widget.user.firstName,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white60,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                  color: Color(0x8f000000), width: 2)),
                          labelText: 'First Name',
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                        ),
                        validator: (value) {
                          if (value.length < 2) {
                            return "Name must be at least 2 characters long";
                          } else
                            return null;
                        },
                        onSaved: (newValue) {
                          firstName = newValue;
                        },
                      ),
                      SizedBox(height: 12),
                      TextFormField(
                        initialValue:
                            widget.firstTimeSetup ? null : widget.user.lastName,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white60,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide(
                                  color: Color(0xffFFC800), width: 2)),
                          labelText: 'Last Name',
                          prefixIcon: const Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                        ),
                        onSaved: (newValue) {
                          lastName = newValue;
                        },
                      ),
                      SizedBox(height: 12),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Color(0x8f000000)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: SearchableDropdown.single(
                            value: widget.firstTimeSetup
                                ? null
                                : widget.user.college,
                            isExpanded: true,
                            hint: "College",
                            searchHint: "Select one",
                            items: items,
                            searchFn: (String keyword, items) {
                              List<int> ret = List<int>();
                              if (keyword != null &&
                                  items != null &&
                                  keyword.isNotEmpty) {
                                keyword.split(" ").forEach((k) {
                                  int i = 0;
                                  items.forEach((item) {
                                    if (k.isNotEmpty &&
                                        (item.value
                                            .toString()
                                            .toLowerCase()
                                            .contains(k.toLowerCase()))) {
                                      ret.add(i);
                                    }
                                    i++;
                                  });
                                });
                              }
                              if (keyword.isEmpty) {
                                ret = Iterable<int>.generate(items.length)
                                    .toList();
                              }
                              return (ret);
                            },
                            displayClearIcon: false,
                            onChanged: (value) {
                              college = value;
                            }),
                      ),
                      SizedBox(height: 12),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            if (_formKey.currentState.validate() &&
                                college != null) {
                              _formKey.currentState.save();
                              DatabaseService().createUserDocument(
                                  user: User(
                                      uid: widget.user.uid,
                                      firstName: firstName,
                                      lastName: lastName,
                                      college: college,
                                      email: widget.user.email,
                                      rollNo: rollNo));
                              if (!widget.firstTimeSetup) {
                                Navigator.of(context).pop();
                              }
                            }
                          },
                          child: Container(
                            width: 0.6 * MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Color(0xffFF9468),
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(0, 4),
                                  blurRadius: 6,
                                  spreadRadius: 0,
                                )
                              ],
                            ),
                            padding: EdgeInsets.symmetric(vertical: 8),
                            child: Center(
                              child: Text(
                                widget.firstTimeSetup
                                    ? "Create Account"
                                    : "Save Details",
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ]),
    );
  }
}
