import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timetable/screens/home/home.dart';
import 'package:timetable/services/auth.dart';
import 'package:timetable/services/google_auth.dart';

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
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50, fontFamily: 'Courgette'),
                  ),
              ],
            ),
            
            SizedBox(height: 80,),
            
            Text(
                  "Sign In",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
                ),
            
            Container(child: Divider(color: Colors.white,), padding: EdgeInsets.fromLTRB(80, 10, 80, 0),),
            SizedBox(height: 50,),
            
            Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(FontAwesomeIcons.google, size: 30, color: Colors.white,),
                  onPressed: () {googleSignIn().whenComplete((){
                    Navigator.of(context).push(MaterialPageRoute(
                      builder:(context){return Home();}
                    ));
                  });},
                ),
                SizedBox(height: 20,),
                FloatingActionButton(
                  onPressed: () async{
                    await googleSignOut();
                    await AuthService().signOut();
                    },
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
