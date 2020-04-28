import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:google_sign_in/google_sign_in.dart';

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();

  //sign in with Google
  Future<FirebaseUser> googleSignIn() async {
    try{
      GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn(); // this shows the popup screen
      if(googleSignInAccount!=null){ // check if we go back without tapping on any account
        GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.getCredential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );
        final AuthResult result = (await _auth.signInWithCredential(credential));
        final FirebaseUser user = result.user;
        // print(user);
        // print(result);
        assert(user.email!=null);
        assert(user.displayName != null);  
        assert(!user.isAnonymous);
        assert(await user.getIdToken() != null);
        
        final FirebaseUser currentUser = await _auth.currentUser();
        assert(currentUser.uid == user.uid);
        
        return user;
      }
      return null;
      }
    on PlatformException catch(e){
      print(e.toString());
      return null;
    }
    catch(e){
      print("other error");
      print(e.toString());
      return null;
      }
  }

  //logout
  void googleSignOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    print("User signed out");
  }
