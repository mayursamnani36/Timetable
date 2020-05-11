import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timetable/constants/constants.dart';
import 'package:timetable/constants/functions.dart';
import 'package:timetable/services/auth.dart';

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {

  //state
    TimeOfDay _time = TimeOfDay.now();
    TimeOfDay picked;
    String startTime, endTime, task;
    FirebaseUser user;
    final _formKey = GlobalKey<FormState>();
    final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

    void inputData()async{
      user = await AuthService().getUser();
    }

    void showSnackBar(){
      final snackBar = SnackBar(
        content: Text("TimeTable Created"),
        duration: Duration(seconds: 3),
        backgroundColor: Color(0Xff7ac143),
        );
        _scaffoldKey.currentState.showSnackBar(snackBar);
    }

  @override
    void initState() {
        super.initState();
        startTime = "Not selected Yet";
        endTime = "Not selected Yet";
        task = "";
        inputData();
    }

  @override
  Widget build(BuildContext context) {
    
    Future selectTime() async{
      try{
        picked = await showTimePicker(
          context: context,
          initialTime: _time,
          builder: (BuildContext context, Widget child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                child: child,
            );
          },
        );
        if(picked != null){setState(() {_time = picked;});}
        }
      catch(e){print(e.toString());} 
    }

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
      ),
      
      body: Container(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(50),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      FloatingActionButton(
                        heroTag: "btn1",
                        child:Icon(FontAwesomeIcons.clock),
                        backgroundColor: Color(0Xff7ac143),
                        onPressed: ()async{ await selectTime(); if(picked!=null){setState(() {
                          startTime = _time.toString().substring(10,15);
                        });}},
                      ),
                      Text("    Start time: $startTime", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                    ],
                  ),
                  
                  SizedBox(height: 30,),
                  
                  Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     children: <Widget>[
                      FloatingActionButton(
                        heroTag: "btn2",
                        child:Icon(FontAwesomeIcons.clock),
                        backgroundColor: Color(0Xff7ac143),
                        onPressed: ()async{ await selectTime(); if(picked!=null){setState(() {
                          endTime = _time.toString().substring(10,15);
                        });}},
                      ),
                      Text("    End time: $endTime" , style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                    ],
                  ),
                  
                  SizedBox(height: 40,),
                  
                  TextFormField(
                    cursorColor: Colors.blue[900],
                    validator: (value){
                      if(value.isEmpty){return "Please enter a valid task";}
                      return null;
                    },
                    autocorrect: false,
                    decoration: textInputDecoration.copyWith(hintText:"Your Task", suffixIcon: Icon(FontAwesomeIcons.pencilAlt)),
                    onChanged: (val){setState(() {
                      task = val;
                    });},
                  ),
                  
                  SizedBox(height: 20,),
                  
                  MaterialButton(
                    child: Text('Create', style: TextStyle(color: Colors.white, fontSize: 20),),
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    splashColor: Colors.blue[900],
                    color: Color(0Xff7ac143),
                    onPressed: (){
                      if(startTime == "Not selected Yet"|| endTime=="Not selected Yet" || !_formKey.currentState.validate()){
                        showAlert(context);
                      }
                      else{
                        createRecord(startTime, endTime, task, user);
                        showSnackBar();
                        _formKey.currentState.reset();
                        setState(() {
                          startTime = "Not selected Yet";
                          endTime = "Not selected Yet";
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}