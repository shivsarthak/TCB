import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:thecollegebee/widgets/loadingDialog.dart';

class AuthenticationService with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  Stream<FirebaseUser> getUser() {
    return _auth.onAuthStateChanged;
  }

  Future logout() async {
    var result = FirebaseAuth.instance.signOut();
    await googleSignIn.signOut();
    notifyListeners();
    return result;
  }

  Future<FirebaseUser> signInWithGoogle(BuildContext context) async {
    LoadingDialog.showLoadingDialog(context);
    try {
      final GoogleSignInAccount googleSignInAccount =
          await googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential credential = GoogleAuthProvider.getCredential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      final AuthResult authResult =
          await _auth.signInWithCredential(credential);
      final FirebaseUser user = authResult.user;
      assert(!user.isAnonymous);
      assert(await user.getIdToken() != null);

      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);
      Navigator.of(context).pop();
      return user;
    } catch (e) {
      Navigator.of(context).pop();
      return Future.error("Sign in interrupted");
    }
  }

  Future<FirebaseUser> signInWithEmail({String email, String password}) async {
    try {
      var result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      notifyListeners();
      return result.user;
    } catch (e) {
      switch (e.code) {
        case "ERROR_INVALID_EMAIL":
        case "ERROR_USER_NOT_FOUND":
          return Future.error(
              "No User Found with the given e-mail, create an account first");
          break;
        case "ERROR_WRONG_PASSWORD":
          return Future.error("Wrong password");
          break;
        case "ERROR_USER_DISABLED":
          return Future.error(
              "Your account is disabled try contacting the developers at contact@thecollegebee.com");
          break;
        case "ERROR_TOO_MANY_REQUESTS":
          return Future.error("Too many login attempts detected from your IP");
          break;
        default:
          return Future.error(
              "Could not sign in, try again later or check your connectivity");
      }
    }
  }
}
