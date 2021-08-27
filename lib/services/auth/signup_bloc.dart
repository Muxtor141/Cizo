import 'package:firebase_auth/firebase_auth.dart';

class Authentication {
  FirebaseAuth firebase = FirebaseAuth.instance;
  Future registrateUser(String email, String password) async {
    try {
      UserCredential userCredential = await firebase
          .createUserWithEmailAndPassword(email: email, password: password);
      User? user = userCredential.user;

      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        print("Invalid email");
      } else if (e.code == 'operation-not-allowed') {
        print("Not Allowed");
      }
    } catch (e) {
      print('${e} AUTH PROBLEM');
    }
  }

  Stream<User> get user => firebase.authStateChanges().map((event) => event!);
}

class SignUp extends Authentication {
  final String email;
  final String password;
  SignUp(this.email, this.password);
}
class GetUserStatus extends Authentication{
  
}