import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:timetable/screens/authenticate/login.dart';
import 'package:timetable/screens/authenticate/register.dart';
import 'package:timetable/screens/authenticate/sign_in.dart';
import 'package:timetable/screens/home/add.dart';
import 'package:timetable/screens/home/home.dart';
import 'package:timetable/screens/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:timetable/services/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: StreamProvider<FirebaseUser>.value(
        value: AuthService().user,
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            fontFamily: 'Montserrat',
          ),
          routes: {
            '/': (context)=> Wrapper(),
            '/homeroute': (context) => Home(),
            '/loginroute': (context) => Login(),
            '/registerroute': (context) => Register(),
            '/signinroute': (context) => SignIn(),
            '/addroute': (context) => Add(),
          },
        ),
      ),
    );
  }
}
