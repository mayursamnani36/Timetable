import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

            Column(
    
              children: <Widget>[
                FlatButton(
                  padding: EdgeInsets.fromLTRB(60, 10, 60, 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                  color: Colors.white,
                  child: Text("Register", style: TextStyle(color: Colors.blue[900], fontFamily: 'Montserrat', fontSize: 20),),
                  onPressed: (){
                    Navigator.pushNamed(context, '/registerroute');},
              ),

                SizedBox(height: 10),              

                FlatButton(
                  padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                  color: Colors.blue[900],
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
                  side: BorderSide(width: 2, color: Colors.white,),),
                  child: Text("Login", style: TextStyle(fontSize: 20, color: Colors.white),),
                  onPressed: (){
                    Navigator.pushNamed(context, '/loginroute');},
                ),
              ]
            ),

            SizedBox(height: 40,),
            
            Text(
                  "OR",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
                ),
            SizedBox(height: 40,),
            
            Text(
                  "Sign In",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
                ),
            
            Container(child: Divider(color: Colors.white,), padding: EdgeInsets.fromLTRB(80, 10, 80, 0),),
            SizedBox(height: 30,),
            
            Column(
              children: <Widget>[
                IconButton(
                  icon: Icon(FontAwesomeIcons.google, size: 30, color: Colors.white,),
                  onPressed: () async {
                    await googleSignIn();
                    },
                ),
              ]
            ),
          ],
        ),
      ),
    );
  }
}
