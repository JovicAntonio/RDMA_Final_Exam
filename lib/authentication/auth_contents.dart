import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../main_page/main_page.dart';

class AuthContent extends StatefulWidget {
  const AuthContent({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AuthContent();
  }
}

class _AuthContent extends State<AuthContent> {
  final username_auth = TextEditingController();
  final passwd_auth = TextEditingController();

  @override
  void dispose() {
    username_auth.dispose();
    passwd_auth.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Padding(
                  padding: EdgeInsetsDirectional.symmetric(
                    horizontal: 10,
                    vertical: 70,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Prijava",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      Image(
                        image: AssetImage("lib/images/iBUS-logo.png"),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: TextField(
                    controller: username_auth,
                    cursorColor: const Color.fromARGB(255, 220, 130, 14),
                    decoration: const InputDecoration(
                      labelText: "Korisničko ime:",
                      border: InputBorder.none,
                      filled: true,
                      floatingLabelStyle: TextStyle(color: Colors.black),
                      fillColor: Color.fromARGB(174, 217, 217, 217),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          style: BorderStyle.solid,
                          color: Color.fromARGB(255, 255, 159, 34),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: TextField(
                    controller: passwd_auth,
                    cursorColor: const Color.fromARGB(174, 220, 130, 14),
                    obscureText: true,
                    obscuringCharacter: '•',
                    decoration: const InputDecoration(
                      label: Text("Lozinka:"),
                      border: InputBorder.none,
                      filled: true,
                      floatingLabelStyle: TextStyle(color: Colors.black),
                      fillColor: Color.fromARGB(255, 217, 217, 217),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          style: BorderStyle.solid,
                          color: Color.fromARGB(255, 213, 133, 33),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: TextButton(
                    onPressed: () async {
                      try {
                        await FirebaseAuth.instance
                            .signInWithEmailAndPassword(
                                email: username_auth.text,
                                password: passwd_auth.text)
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
                    },
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      minimumSize:
                          const MaterialStatePropertyAll(Size(350, 51)),
                      backgroundColor: const MaterialStatePropertyAll(
                        Color.fromARGB(255, 255, 119, 0),
                      ),
                    ),
                    child: const Text(
                      'Prijava',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
        return const MaterialApp(
          home: Scaffold(
            body: Text("Loading"),
          ),
        );
      },
    );
  }
}

void showError(BuildContext context, String errorMsg) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text("Greška"),
        content: Text(errorMsg),
        actions: [
          TextButton(
            child: const Text("OK"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
