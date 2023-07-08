import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      alignment: Alignment.center,
      icon: const Icon(Icons.menu),
      tooltip: 'Menu',
      onPressed: () {
        if (Scaffold.of(context).isDrawerOpen) {
          Scaffold.of(context).closeDrawer();
        } else {
          Scaffold.of(context).openDrawer();
        }
      },
    );
  }
}
