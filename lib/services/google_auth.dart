import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = new GoogleSignIn();

  //Auth change user stream
  //sign in with Google
  Future<FirebaseUser> googleSignIn() async {
    try{
      GoogleSignInAccount googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
      return user;
      }
    catch(e){
      print(e); return null;
      }
  }

  //logout
  void googleSignOut() async {
    await _googleSignIn.signOut();
    print("User signed out");
  }

}
