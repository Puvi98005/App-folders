import 'package:firebase_auth/firebase_auth.dart';

class AuthServiceHelper {

  static Future<String> createAccountwithEmail(
    String email,
    String password,
  ) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "Account Created!";
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    } catch (e) {
      return e.toString();
    }
  }


  //login

  static Future<String> loginwithEmail(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return "Login Succesful";
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    } catch (e) {
      return e.toString();
    }
  }

  //logout

  static Future logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      return "Logout succesful";
    } on FirebaseAuthException catch (e) {
      return e.message.toString();
    } catch (e) {
      return e.toString();
    }
  }



  //check user

static Future<bool> isuserloggedIn() async{
  var currentuser = FirebaseAuth.instance.currentUser;

   return currentuser!=null? true : false;
}
}

