import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import '../helpers.dart';

class AuthContent extends StatefulWidget {
  const AuthContent({super.key});

  @override
  State<StatefulWidget> createState() {
    return _AuthContent();
  }
}

class _AuthContent extends State<AuthContent> {
  final usernameAuth = TextEditingController();
  final passwdAuth = TextEditingController();

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    usernameAuth.dispose();
    passwdAuth.dispose();
    super.dispose();
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
                    controller: usernameAuth,
                    cursorColor: const Color.fromARGB(255, 220, 130, 14),   
                    decoration: const InputDecoration(
                      labelText: "Korisničko ime:",
                      border: InputBorder.none,
                      filled: true,
                      floatingLabelStyle:  TextStyle(color: Colors.black),
                      fillColor:  Color.fromARGB(174, 217, 217, 217),
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
                    controller: passwdAuth,
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
                    onPressed: () {
                      isAuthenticatedUser(
                          usernameAuth.text, passwdAuth.text, context);
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
