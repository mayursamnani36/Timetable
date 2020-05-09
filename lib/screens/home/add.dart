import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timetable/constants/constants.dart';

class Add extends StatefulWidget {
  @override
  _AddState createState() => _AddState();
}

class _AddState extends State<Add> {
  @override
  Widget build(BuildContext context) {
    TimeOfDay _time = TimeOfDay.now();

    Future selectTime() async{
      try{_time = await showTimePicker(context: context, initialTime: _time);}
      catch(e){print(e.toString());} 
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
      ),
      body: Container(
        child: Form(
          child: Padding(
            padding: EdgeInsets.all(50),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: "Start Time", suffixIcon: Icon(FontAwesomeIcons.clock),),
                    onTap: (){selectTime();},
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText: "End Time", suffixIcon: Icon(FontAwesomeIcons.clock),),
                    onTap: (){selectTime();},
                  ),
                  SizedBox(height: 20,),
                  TextFormField(
                    decoration: textInputDecoration.copyWith(hintText:"Your Task", suffixIcon: Icon(FontAwesomeIcons.pencilAlt)),
                  ),
                  SizedBox(height: 20,),
                  MaterialButton(
                    child: Text('Create', style: TextStyle(color: Colors.white, fontSize: 20),),
                    padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                    splashColor: Colors.blue[900],
                    color: Color(0Xff7ac143),
                    onPressed: (){},
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