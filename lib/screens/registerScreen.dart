import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _autovalidate = false;
  String _email, _pass, _rePass;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: <Widget>[
        Center(
          child: SingleChildScrollView(
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
                      fontFamily: 'LogoFont',
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Create A New Account",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      //fontFamily: 'LogoFont',
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
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
                                      color: Color(0xffFFC800), width: 2)),
                              labelText: 'E-Mail',
                              prefixIcon: const Icon(
                                Icons.alternate_email,
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
                                      color: Color(0xffFFC800), width: 3)),
                              labelText: 'Password',
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                            ),
                            validator: (value) {
                              if (value != null) {
                                _pass = value;
                              }
                              if (value.length < 6)
                                return 'Password must be more than 6 charater';
                              else
                                return null;
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
                                      color: Color(0xffFFC800), width: 3)),
                              labelText: 'Re-Enter Password',
                              prefixIcon: const Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                            ),
                            validator: (value) {
                              if (value != _pass) {
                                return 'Passwords dont match';
                              }
                              return null;
                            },
                            onSaved: (newValue) {
                              _rePass = newValue;
                            },
                          ),
                          SizedBox(height: 12),
                        ],
                      )),
                  GestureDetector(
                    onTap: () => _validateInputs(),
                    child: Container(
                      width: 0.6 * MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Color(0xffFFC800),
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
                          "Create Account",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 12),
                  GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.black,
                      )),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  Future<void> _validateInputs() async {}
}
