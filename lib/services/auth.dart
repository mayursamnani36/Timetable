import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
  
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //auth change user stream
  Stream<FirebaseUser> get user{
    return _auth.onAuthStateChanged;
  }

  //register with email and password
  Future<FirebaseUser> registerWithEmailAndPassword(String email, String password) async{
    try{
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user;
      return user; //here user can be FirebaseUser or null this is checked in the form
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password
  Future<FirebaseUser> signInWithEmailAndPassword(String email, String password)async{
    try{
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      FirebaseUser user = result.user; //here user can be FirebaseUser or null this is checked in the form
      return user;
    }
    catch(e){
      print(e.toString());
      return null;
    }
  }

  //sign out
  Future signOut()async{
    try{return await _auth.signOut();}
    catch(e){print(e.tostring());}
  }

  Future<FirebaseUser> getUser() async {
    FirebaseUser user = await _auth.currentUser();
    return user;
  }

}