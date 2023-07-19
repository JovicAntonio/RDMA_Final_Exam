import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'main_page/main_page.dart';

String User = '';
String Pass = '';

Future<void> isAuthenticatedUser(user, pass, context) async {
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
      User = user;
      Pass = pass;
    });
  } on FirebaseAuthException catch (e) {
    String msg = parseFirebaseAuthExceptionMessage(input: e.message);
    if (msg == "user-not-found") {
      showError(context, "Takav korisnik ili lozinka ne postoji.");
    } else if (msg == "invalid-email") {
      showError(context, "Takav korisnik ili lozinka nisu valjani.");
    } else if (msg == "wrong-password") {
      showError(context, "Unijeli ste pogrešnu lozinku.");
    } else if (msg == "too-many-requests") {
      showError(context,
          "Previše puta ste unijeli pogrešne podatke. Molimo, pokušajte kasnije.");
    } else if (msg == "missing-email") {
      showError(context, "Niste unijeli korisničko ime.");
    } else if (msg == "missing-password") {
      showError(context, "Niste unijeli lozinku.");
    } else {
      showError(context, "Dogodila se neočekivana greška.");
    }
  }
}

Future<void> registerUser(user, pass, context) async {
  try {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: user, password: pass)
        .then((value) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const MainPage()));
    });
  } on FirebaseException catch (e) {
    String msg = parseFirebaseAuthExceptionMessage(input: e.message);
    if (msg == "email-already-in-use") {
      showError(context, "Korisnik s tim korisničkim imenom već postoji.");
    } else if (msg == "weak-password") {
      showError(context,
          "Vaša lozinka je jednostavna. Probajte unijeti jaču lozinku.");
    } else if (msg == "missing-email") {
      showError(context, "Niste unijeli korisničko ime.");
    } else if (msg == "missing-password") {
      showError(context, "Niste unijeli lozinku.");
    } else if (msg == "invalid-email") {
      showError(context, "Unijeli ste pogrešan format korisničkom imena.");
    } else {
      showError(context, "Dogodila se neočekivana greška!");
    }
  }
}

launchURL(url) async {
  Uri _url = Uri.parse(url);
  if (await launchUrl(_url)) {
    await launchUrl(_url);
  } else {
    throw 'Something went wrong!';
  }
}

Future<void> showError(BuildContext context, String errorMsg) async {
  await showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text(
          "Nešto je pošlo po zlu...",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        content: Text(errorMsg),
        actions: [
          TextButton(
            child: const Text(
              "OK",
              style: TextStyle(
                color: Color.fromARGB(255, 255, 119, 0),
              ),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

String parseFirebaseAuthExceptionMessage(
    {String plugin = "auth", required String? input}) {
  if (input == null) {
    return "unknown";
  }
  String regexPattern = r'(?<=\(' + plugin + r'/)(.*?)(?=\)\.)';
  RegExp regExpr = RegExp(regexPattern);
  Match? match = regExpr.firstMatch(input);
  if (match != null) {
    return match.group(0)!;
  }

  return "unknown";
}

Future<void> showLoadingScreen(user, pass, context) async {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return const Dialog(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(
                  color: Color.fromARGB(255, 255, 119, 0),
                ),
                SizedBox(
                  height: 15,
                ),
                Text('Učitavanje...'),
              ],
            ),
          ),
        );
      });
  Navigator.of(context).pop();
}
