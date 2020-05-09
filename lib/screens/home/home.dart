import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timetable/services/auth.dart';
import 'package:timetable/services/google_auth.dart';

String name = "Unknown";
String email = "Unknown";
String url =
    "https://www.vippng.com/png/detail/416-4161690_empty-profile-picture-blank-avatar-image-circle.png";

void inputData() async {
  FirebaseUser user = await AuthService().getUser();
  name = user.displayName;
  email = user.email;
  url = user.photoUrl;
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    inputData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(url),
              ),
              accountName: Text(
                name,
                style: TextStyle(fontSize: 25, color: Color(0Xff7ac143)),
              ),
              accountEmail: Text(
                email,
                style: TextStyle(fontSize: 15),
              ),
              decoration: BoxDecoration(color: Colors.blue[900]),
            ),
            ListTile(
              title: Text('Logout'),
              leading: Icon(Icons.exit_to_app),
              onTap: () {
                googleSignOut();
                Navigator.pop(context);
                Navigator.pushNamed(context, '/signinroute');
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(FontAwesomeIcons.plus),
        backgroundColor: Color(0Xff7ac143),
      ),
    );
  }
}
