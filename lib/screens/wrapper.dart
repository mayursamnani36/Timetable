import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:timetable/screens/authenticate/authenticate.dart';
import 'package:timetable/screens/home/home.dart';
class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<FirebaseUser>(context);
    if(user!=null){return Home();}
    else return Authenticate();
  }
}
