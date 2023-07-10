import 'package:flutter/material.dart';
import 'drawer.dart';
import 'maps.dart';
import 'menu_button.dart';

final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);
bool _themeBool = true;
IconData _lightIcon = Icons.light_mode;
IconData _darkIcon = Icons.dark_mode;

ThemeMode mode = ThemeMode.light;

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: _notifier,
      builder: (_, mode, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'IBus',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: mode,
          home: Scaffold(
            drawer: const DrawerLookup(),
            appBar: AppBar(
              title: const Text(
                'IBus',
              ),
              centerTitle: true,
              backgroundColor: const Color.fromARGB(255, 239, 152, 47),
              shadowColor: Colors.black,
              leading: const MenuButton(),
              actions: [
                IconButton(
                    alignment: Alignment.center,
                    icon: Icon(_themeBool ? _lightIcon : _darkIcon),
                    tooltip: 'Change theme',
                    onPressed: () {
                      _notifier.value = mode == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light;
                      _themeBool = !_themeBool;
                    }),
              ],
            ),
            body: Maps(),
          ),
        );
      },
    );
  }
}
