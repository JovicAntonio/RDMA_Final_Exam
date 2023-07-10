import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zavrsni_rdma/about/about.dart';
import 'package:zavrsni_rdma/main_page/main_page.dart';
import '../authentication/auth_page.dart';

class DrawerLookup extends StatelessWidget {
  final Color barColor;
  const DrawerLookup({super.key, required this.barColor});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        Container(
          height: 57,
          color: barColor,
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  if (Scaffold.of(context).isDrawerOpen) {
                    Scaffold.of(context).closeDrawer();
                  } else {
                    Scaffold.of(context).openDrawer();
                  }
                },
                icon: const Icon(Icons.arrow_back_sharp),
                style: const ButtonStyle(
                  iconSize: MaterialStatePropertyAll(18),
                ),
              ),
              const Text(
                'Izbornik',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
        ListTile(
          onTap: () {},
          title: const Row(
            children: [
              Icon(Icons.person_2_outlined),
              Text('Profil'),
            ],
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MainPage(),
              ),
            );
          },
          title: const Row(
            children: [
              Icon(Icons.home_outlined),
              Text('Početna'),
            ],
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => new About(),
              ),
            );
          },
          title: const Row(
            children: [
              Icon(Icons.info_outlined),
              Text('O nama'),
            ],
          ),
        ),
        ListTile(
          tileColor: const Color.fromARGB(255, 204, 112, 112),
          onTap: () {
            signOut();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const AuthPage(),
              ),
            );
          },
          title: const Row(
            children: [
              Icon(Icons.logout_outlined),
              Text('Odjava'),
            ],
          ),
        ),
      ]),
    );
  }
}

void signOut() async {
  await FirebaseAuth.instance.signOut();
}
