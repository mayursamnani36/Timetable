import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:timetable/services/auth.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  String email="";
  String password="";
  String error = "";
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        elevation: 0.0,
        leading: IconButton(
          icon : Icon(FontAwesomeIcons.chevronLeft, color: Colors.white,),
          onPressed: (){Navigator.pop(context);},
          )
      ),
      backgroundColor: Colors.blue[900],
      body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(50),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                      "TimeTable",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 50, fontFamily: 'Courgette'),
                      ),

                  SizedBox(height: 100,),
                  
                  TextFormField(
                    validator: (val)=> (val.contains('@')&&val.contains('.')) ?  null: 'Enter a valid email',
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white54)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                      labelText: 'Email',
                      labelStyle: TextStyle(color: Colors.white54 , fontSize: 13), 
                    ),
                    style: TextStyle(color: Colors.white, fontSize: 17),
                    cursorColor: Colors.white,
                    onChanged: (val){
                      setState(() {
                      email = val;
                    });},
                  ),

                  SizedBox(height: 15,),

                  TextFormField(
                    validator: (val) => val.length > 7 ? null : 'password must be atleast 8 characters long'  ,
                    obscureText: true,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white54)),
                      focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                      labelText: 'Password',
                      labelStyle: TextStyle(color: Colors.white54 , fontSize: 13), 
                    ),
                    style: TextStyle(color: Colors.white, fontSize: 17),
                    cursorColor: Colors.white,
                    onChanged: (val){
                      setState(() {
                        password = val;  
                      });
                    },
                  ),
                  SizedBox(height: 30,),
                  FlatButton(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(width: 3, color: Colors.white,),),
                    child: Text( "Login" , style: TextStyle(fontSize: 20, color: Colors.blue[900],)),
                    onPressed: ()async{
                      try{
                        if(_formKey.currentState.validate()){
                          dynamic result = await AuthService().signInWithEmailAndPassword(email, password);
                          if(result==null){setState(() {
                            error = 'Could not sign in';
                          });}
                          else{Navigator.pop(context);}
                        }
                      }
                      on PlatformException catch(e){
                        setState(() {
                          error = e.toString();
                        });
                      }
                      catch(e){
                        setState(() {
                          error = 'Error occured';
                        });
                      }
                    },
                 ),
                 SizedBox(height: 20),
                 Text(
                   error,
                   style: TextStyle(color: Colors.redAccent, fontSize: 20),
                 )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//TODO ek toh navigation jisme bohot baar back lene par show ho rha hai after login or register
// TODO Renderflex overflow
