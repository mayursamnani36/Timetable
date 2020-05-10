import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
final _databaseReference = Firestore.instance;

  void showAlert(context){
    showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          title: Text("Alert"),
          content: Text("Choose a valid Time"),
          actions: <Widget>[
            FlatButton(child: Text("Close"), onPressed: (){Navigator.pop(context);},),
          ],
        );
      }
    );
  }

void createRecord(String startTime, String endTime, String task, bool deleted, FirebaseUser user)async{
      await _databaseReference.collection(user.uid).document(task).setData(
        {
          'startTime': startTime,
          'endTime': endTime,
          'task': task,
          'deleted': deleted
        }
      );
    }