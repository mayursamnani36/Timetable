import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timetable/constants/cardtemplate.dart';
import 'package:timetable/constants/loading.dart';
import 'package:timetable/services/auth.dart';
import 'package:timetable/services/google_auth.dart';

class Home extends StatefulWidget {
 
  @override
  _HomeState createState() => _HomeState();
}


class _HomeState extends State<Home> {
  //state
  String name = "";
  String email = "";
  String url = "";
  bool loading = true;
  List<DocumentSnapshot> result;
  FirebaseUser currentUser;

  Firestore _databasereference = Firestore.instance;

  void referesh()async{
    QuerySnapshot snapshot = await _databasereference.collection(currentUser.uid.toString()).orderBy('startTime').getDocuments();
    List<DocumentSnapshot> tempresult = snapshot.documents;
    setState(() {
      result = tempresult;
    });
  }
  
  void inputData(String tempName, String tempEmail, String tempUrl) async {
    FirebaseUser user = await AuthService().getUser(); 
    
    user.displayName!=null ? tempName = user.displayName: tempName = "Unknown";
    user.email!=null ? tempEmail = user.email: tempEmail = "Unknown";
    user.photoUrl!=null ? tempUrl = user.photoUrl: tempUrl = "https://www.vippng.com/png/full/203-2034148_font-awesome-user-icon-circle.png";
    
    QuerySnapshot snapshot = await _databasereference.collection(user.uid.toString()).orderBy('startTime').getDocuments();
    List<DocumentSnapshot> tempresult = snapshot.documents;
    
    setState(() {
      name = tempName;
      email=tempEmail;
      url = tempUrl;
      result = tempresult;
      currentUser = user;
      loading = false;
    });
  }

  @override
    void initState() {
      super.initState();
      inputData('','','');
    }

  @override 
  Widget build(BuildContext context) {
    print(currentUser);
    return loading==true? Loading() : Scaffold(
      
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text(
          "TimeTable",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20, fontFamily: 'Courgette'),
        ),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.only(right: 20),
            iconSize: 20,
            icon: const Icon(Icons.refresh),
            tooltip: 'referesh',
            onPressed: () {
              referesh();
            },
          ),
        ],
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
              },
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
        child: ListView.builder(
          itemCount: result.length,
          itemBuilder: (context, index){
            String st = result[index].data['startTime'].toString();
            String et = result[index].data['endTime'].toString();
            String t = result[index].data['task'].toString();
            return CardTemplate(startTime: st, endTime: et, task: t, user: currentUser);
          },
        )
      ),
 
      floatingActionButton: FloatingActionButton(
        onPressed: () {Navigator.pushNamed(context, '/addroute');},
        child: Icon(FontAwesomeIcons.plus),
        backgroundColor: Color(0Xff7ac143),
      ),
    );
  }
}
