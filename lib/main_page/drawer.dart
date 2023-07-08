import 'package:flutter/material.dart';

class DrawerLookup extends StatelessWidget {
  const DrawerLookup({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        Container(
          height: 57,
          color: const Color.fromARGB(255, 239, 152, 47),
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
                'Menu',
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
              Text('Profile'),
            ],
          ),
        ),
        ListTile(
          onTap: () {},
          title: const Row(
            children: [
              Icon(Icons.settings),
              Text('Settings'),
            ],
          ),
        ),
        ListTile(
          onTap: () {},
          title: const Row(
            children: [
              Icon(Icons.info_outlined),
              Text('About'),
            ],
          ),
        ),
        ListTile(
          onTap: () {},
          title: const Row(
            children: [
              Icon(Icons.logout_outlined),
              Text('Logout'),
            ],
          ),
        ),
      ]),
    );
  }
}
