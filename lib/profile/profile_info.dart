import 'package:flutter/material.dart';

import '../helpers.dart';
import '../main_page/drawer.dart';
import '../main_page/menu_button.dart';

ThemeMode mode = ThemeMode.system;
bool _themeBool = true;
IconData _lightIcon = Icons.light_mode;
IconData _darkIcon = Icons.dark_mode;
final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);
const Color barColor = Color.fromARGB(255, 255, 119, 0);

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, mode, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'IBus',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: mode,
          home: Scaffold(
            drawer: const DrawerLookup(
              barColor: barColor,
            ),
            appBar: AppBar(
              title: const Text(
                'IBus',
              ),
              centerTitle: true,
              backgroundColor: barColor,
              shadowColor: Colors.black,
              leading: const MenuButton(),
              actions: [
                IconButton(
                    alignment: Alignment.center,
                    icon: Icon(_themeBool ? _lightIcon : _darkIcon),
                    tooltip: 'Promijeni temu',
                    onPressed: () {
                      themeNotifier.value = mode == ThemeMode.light
                          ? ThemeMode.dark
                          : ThemeMode.light;
                      _themeBool = !_themeBool;
                    }),
              ],
            ),
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  Column(
                    children: <Widget>[
                       const Padding(
                        padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            textAlign: TextAlign.left,
                            "Profil",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                       Padding(
                        padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 40,
                          vertical: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[ 
                            const Text(
                            textAlign: TextAlign.left,
                            "Korisničko ime:",
                          ),
                            Text(
                            textAlign: TextAlign.right,
                            User,
                          ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.symmetric(
                          horizontal: 40,
                          vertical: 10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:[ 
                            const Text(
                            textAlign: TextAlign.left,
                            "Lozinka:",
                          ),
                            Text(
                            textAlign: TextAlign.right,
                            Pass,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
