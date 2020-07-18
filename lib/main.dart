import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:thecollegebee/screens/loginScreen.dart';
import 'package:thecollegebee/services/authenticationService.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'TheCollegeBee',
      theme: ThemeData(
        fontFamily: "Roboto",
        primarySwatch: Colors.yellow,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StreamProvider.value(
        value: AuthenticationService().getUser(),
        child: LoginScreen(),
      ),
    );
  }
}
