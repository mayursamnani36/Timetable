import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timetable/screens/authenticate/authenticate.dart';
import 'package:timetable/screens/authenticate/sign_in.dart';
import 'package:timetable/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return either home or authenticate widgets
    return Authenticate();
  }
}
