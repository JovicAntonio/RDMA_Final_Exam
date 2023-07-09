import 'package:flutter/material.dart';
import 'package:zavrsni_rdma/authentication/auth_page.dart';
import 'package:zavrsni_rdma/main_page/main_page.dart';
import 'package:firebase_core/firebase_core.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.web,
    );
  runApp(
    const AuthPage(),
  );
}
