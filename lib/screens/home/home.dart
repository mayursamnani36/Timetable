import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timetable/services/auth.dart';
import 'package:timetable/services/google_auth.dart';

class Home extends StatefulWidget {
 
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
  String name = "";
  String email = "";
  String url = "";

  void inputData(String tempName, String tempEmail, String tempUrl) async {
  FirebaseUser user = await AuthService().getUser();
  user.displayName!=null ? tempName = user.displayName: tempName = "Unknown";
  user.email!=null ? tempEmail = user.email: tempEmail = "Unknown";
  user.photoUrl!=null ? tempUrl = user.photoUrl: tempUrl = "https://www.vippng.com/png/full/203-2034148_font-awesome-user-icon-circle.png";
  setState(() {
    name = tempName;
    email=tempEmail;
    url = tempUrl;
  }); 
}

  @override
    void initState() {
        super.initState();
        inputData('','','');
    }

  @override 
  Widget build(BuildContext context) {
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
                style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
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
        onPressed: () {Navigator.pushNamed(context, '/addroute');},
        child: Icon(FontAwesomeIcons.plus),
        backgroundColor: Color(0Xff7ac143),
      ),
    );
  }
}
