import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Firestore _databaseReference = Firestore.instance;

class CardTemplate extends StatelessWidget {
  final String startTime, endTime, task;
  final FirebaseUser user;
  @override

  CardTemplate({this.startTime, this.endTime, this.task, this.user});
  Widget build(BuildContext context) {
    //print(user);
    return Card(
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(startTime, style: TextStyle(fontSize: 18, color: Color(0Xff7ac143)),),
                  Text('To', style: TextStyle(fontSize: 18),),
                  Text(endTime, style: TextStyle(fontSize: 18, color: Color(0Xff7ac143)),),
                ],
              ),
              SizedBox(height: 30,),
              Text(task, style: TextStyle(fontSize: 25,color: Colors.blue[900]),),
              SizedBox(height: 10,),
              IconButton(
                icon: Icon(FontAwesomeIcons.trashAlt),
                color: Colors.red,
                onPressed:()async{ await _databaseReference.collection(user.uid).document(task).delete(); } ,
              )
          ],
        ),
      ),
    );
  }
}