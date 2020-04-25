import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timetable/screens/home/home.dart';
import 'package:timetable/services/google_auth.dart';

GoogleAuthService service = new GoogleAuthService();

class SignIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: Container(
        padding: EdgeInsets.all(40),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.max,
          
          children: <Widget>[
            SizedBox(height: 60,),
            Column(
              children: <Widget>[
                Text(
                  "TimeTable",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50, fontFamily: 'Courgette-Regular'),
                  ),
              ],
            ),
            SizedBox(height: 80,),
            Column(
              children: <Widget>[
                Text(
                  "Get your time organized and be happy at the end of the day",
                  textAlign: TextAlign.justify,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
                  ),
              ],
            ),
            SizedBox(height: 80,),
            Text(
                  "Sign In",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
                ),
            SizedBox(height: 50,),
            Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(FontAwesomeIcons.google, size: 30, color: Colors.white,),
                  onPressed: () {service.googleSignIn().whenComplete((){
                    Navigator.of(context).push(MaterialPageRoute(
                      builder:(context){return Home();}
                    ));
                  });},
                ),
                SizedBox(height: 20,),
                FloatingActionButton(
                  onPressed: () {service.googleSignOut();},
                  backgroundColor: Colors.black,
                  child: Icon(Icons.exit_to_app),
                ),
              ]
            ),
          ],
        ),
      ),
    );
  }
}
