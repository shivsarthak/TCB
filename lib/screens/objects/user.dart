import 'package:flutter/material.dart';

class User {
  @required
  final String uid;
  @required
  final String firstName;
  @required
  final String lastName;
  @required
  final String email;
  @required
  final String college;
  String rollNo;

  User(
      {this.uid,
      this.firstName,
      this.lastName,
      this.email,
      this.college,
      this.rollNo});

  factory User.fromJSON(Map<String, dynamic> data) {
    return User(
        uid: data["uid"],
        firstName: data["firstName"],
        lastName: data["lastName"],
        email: data["email"],
        college: data["college"],
        rollNo: data["rollNo"]);
  }
}
