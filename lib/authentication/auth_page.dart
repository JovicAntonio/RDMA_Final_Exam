import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter email...",
                ),
                style: TextStyle(),
              ),
            ),
            const Padding(
              padding: EdgeInsetsDirectional.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter password...",
                ),
                style: TextStyle(),
              ),
            ),
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Login',
                  style: TextStyle(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
