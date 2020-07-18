import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:thecollegebee/screens/appNavigation.dart';
import 'package:thecollegebee/screens/profileScreen.dart';
import 'package:thecollegebee/screens/registerScreen.dart';
import 'package:thecollegebee/services/authenticationService.dart';
import 'package:thecollegebee/widgets/loadingDialog.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _signingIn = false;
  final _formKey = GlobalKey<FormState>();
  bool _autovalidate = false;
  String _email, _password;
  Widget show;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    var user = Provider.of<FirebaseUser>(context);

    print("${user}");
    if (user == null) {
      show = Scaffold(
        key: _scaffoldKey,
        body: Stack(children: <Widget>[
          Center(
              child: Container(
            width: 0.9 * MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image(
                  image: AssetImage("assets/logo/logo1x1.png"),
                  width: 100,
                ),
                SizedBox(height: 8),
                Text(
                  "The College Bee",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                _signingIn
                    ? CircularProgressIndicator()
                    : Column(
                        children: <Widget>[
                          Form(
                            key: _formKey,
                            autovalidate: _autovalidate,
                            child: Column(
                              children: <Widget>[
                                TextFormField(
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white60,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                            color: Color(0xffFFC800),
                                            width: 2)),
                                    labelText: 'E-mail',
                                    prefixIcon: const Icon(
                                      Icons.person,
                                      color: Colors.black,
                                    ),
                                  ),
                                  validator: (value) {
                                    Pattern pattern =
                                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                                    RegExp regex = new RegExp(pattern);
                                    if (!regex.hasMatch(value))
                                      return 'Enter Valid Email';
                                    else
                                      return null;
                                  },
                                  onSaved: (newValue) {
                                    _email = newValue;
                                  },
                                ),
                                SizedBox(height: 12),
                                TextFormField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white60,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(
                                            color: Color(0xffFFC800),
                                            width: 3)),
                                    labelText: 'Password',
                                    prefixIcon: const Icon(
                                      Icons.lock,
                                      color: Colors.black,
                                    ),
                                  ),
                                  onSaved: (newValue) {
                                    _password = newValue;
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 12),
                          GestureDetector(
                            onTap: () async {
                              if (_formKey.currentState.validate()) {
                                _formKey.currentState.save();
                                LoadingDialog.showLoadingDialog(context);
                                try {
                                  await AuthenticationService().signInWithEmail(
                                      email: _email, password: _password);
                                } catch (e) {
                                  _scaffoldKey.currentState
                                      .showSnackBar(SnackBar(content: Text(e)));
                                }
                                Navigator.pop(context);
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xffFFC800),
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black12,
                                        offset: Offset(0, 4),
                                        blurRadius: 6,
                                        spreadRadius: 1,
                                      )
                                    ],
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 32, vertical: 8),
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 24),
                          GestureDetector(
                            onTap: () {
                              try {
                                AuthenticationService()
                                    .signInWithGoogle(context);
                              } catch (e) {
                                _scaffoldKey.currentState
                                    .showSnackBar(SnackBar(content: Text(e)));
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(32),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0, 4),
                                    blurRadius: 6,
                                    spreadRadius: 1,
                                  )
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(32),
                                child: Container(
                                  width:
                                      0.7 * MediaQuery.of(context).size.width,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      SizedBox(width: 12),
                                      Text(
                                        "Sign in with Google",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height,
                                        color: Color(0xffE8E8E8),
                                        child: Row(
                                          children: <Widget>[
                                            SizedBox(width: 12),
                                            Image(
                                              image: AssetImage(
                                                  "assets/googleLogo.png"),
                                              height: 30,
                                            ),
                                            SizedBox(width: 16),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 12),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => RegisterScreen(),
                              ));
                            },
                            child: Container(
                              width: 0.6 * MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                // border: Border.all(color: Colors.black, width: 1),
                              ),
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Center(
                                child: Text(
                                  "Create an Account",
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
              ],
            ),
          )),
        ]),
      );
    } else {
      show = AppNavigation();
    }
    return AnimatedSwitcher(duration: Duration(milliseconds: 300), child: show);
  }
}
