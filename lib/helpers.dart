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
    } else {
      showError(context, "Dogodila se neočekivana greška.");
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
