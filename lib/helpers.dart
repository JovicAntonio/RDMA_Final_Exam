import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'authentication/auth_contents.dart';
import 'main_page/main_page.dart';

Future<UserCredential> getAuthenticatedUser(cred) {
  return cred;
}

void isAuthenticatedUser(user, pass, context) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: user, password: pass)
        .then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const MainPage(),
        ),
      );
    });
  } on FirebaseAuthException catch (e) {
    {
      if (e.code == "user-not-found") {
        showError(context, e.toString());
      } else if (e.code == 'wrong-password') {
        showError(context, e.toString());
      }
    }
  }

  final credentials = FirebaseAuth.instance
      .signInWithEmailAndPassword(email: user, password: pass);

  getAuthenticatedUser(credentials);
}
