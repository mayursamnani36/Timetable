import 'package:flutter/material.dart';
import 'package:timetable/screens/authenticate/authenticate.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //return either home or authenticate widgets
    return Authenticate();
  }
}
