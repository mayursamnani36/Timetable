import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:timetable/screens/wrapper.dart';
import 'package:timetable/services/google_auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
          child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
