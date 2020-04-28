import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:timetable/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:timetable/services/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<FirebaseUser>.value(
      value: AuthService().user,
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Montserrat',
        ),
        home: Wrapper(),
      ),
    );
  }
}
