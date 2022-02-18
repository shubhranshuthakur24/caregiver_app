import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class FireBaseAuth {
  static FirebaseAuth auth = FirebaseAuth.instance;

  static Future<String> firebaseSignUp(@required String email, @required String password, @required String name) async {
    late User user1;
    try {
      print("1111");
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      await userCredential.user!.updateDisplayName(name);
      user1 = await userCredential.user!;
      user1.updateProfile(displayName: "Sameer Singh");
      print("1111");
      print(user1.displayName);
    }
    // on FirebaseAuthException catch (e) {
    //   if (e.code == 'weak-password') {
    //     print('The password provided is too weak.');
    //   } else if (e.code == 'email-already-in-use') {
    //     print('The account already exists for that email.');
    //   }
    // }
    catch (e) {
      print(e);
    }
    return user1.uid;
  }

  static Future<String> firebaseLogIn(@required String email, @required String password) async {
    late User user1;
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      user1 = await userCredential.user!;
      print("profile name");
      print(await userCredential.user!.displayName);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
    return user1.uid;
  }
}
