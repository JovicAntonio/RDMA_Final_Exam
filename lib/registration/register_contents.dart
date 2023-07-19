import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:zavrsni_rdma/authentication/auth_page.dart';

import '../helpers.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<StatefulWidget> createState() {
    return _Register();
  }
}

class _Register extends State<Register> {
  final usernameReg = TextEditingController();
  final passwdReg = TextEditingController();

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    usernameReg.dispose();
    passwdReg.dispose();
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
                    vertical: 40,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Registracija",
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
                    vertical: 15,
                  ),
                  child: TextField(
                    controller: usernameReg,
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
                    vertical: 15,
                  ),
                  child: TextField(
                    controller: passwdReg,
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
                      registerUser(usernameReg.text, passwdReg.text, context);
                    },
                    style: ButtonStyle(
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40),
                        ),
                      ),
                      minimumSize: const MaterialStatePropertyAll(
                        Size(350, 51),
                      ),
                      backgroundColor: const MaterialStatePropertyAll(
                        Color.fromARGB(255, 255, 119, 0),
                      ),
                    ),
                    child: const Text(
                      'Registracija',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 20,
                    vertical: 40,
                  ),
                  child: Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color.fromARGB(179, 134, 134, 134),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.symmetric(
                    horizontal: 0,
                    vertical: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Već imaš račun?",
                      ),
                      TextButton(
                        child: const Text(
                          "Prijavi se!",
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 119, 0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AuthPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }
        return const MaterialApp(
          home: Scaffold(
            body: Text("Loading..."),
          ),
        );
      },
    );
  }
}
