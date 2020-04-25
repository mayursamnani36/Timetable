import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timetable/screens/authenticate/sign_in.dart';
import 'package:timetable/services/google_auth.dart';
import '../../constants/constants.dart';

GoogleAuthService service = new GoogleAuthService();

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

final _formKey = GlobalKey<FormState>();

class _HomeState extends State<Home> {
  String task = "";
  String startTime = "";
  String endTime = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text(
                'Hello There!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.teal,
              ),
            ),
            ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                service.googleSignOut();
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>SignIn(),
                ));
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
          "TimeTable",
          style: TextStyle(letterSpacing: 4, fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal[500],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration:
                    textInputDecoration.copyWith(hintText: 'Start Time'),
                onChanged: (val) {
                  setState(() {
                    startTime = val;
                  });
                },
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a valid start time';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'End Time'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter a valid end time';
                  }
                  return null;
                },
                onChanged: (val) {
                  setState(() {
                    endTime = val;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Your Task'),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please assign a task';
                  }
                  return null;
                },
                onChanged: (val) {
                  setState(() {
                    task = val;
                  });
                },
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                color: Colors.deepOrangeAccent,
                child: Text(
                  "Create",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    print(task);
                    print(startTime);
                    print(endTime);
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
