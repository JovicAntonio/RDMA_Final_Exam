import 'package:flutter/material.dart';
import '../main_page/drawer.dart';
import '../main_page/menu_button.dart';
import 'package:url_launcher/url_launcher.dart';

ThemeMode mode = ThemeMode.system;
bool _themeBool = true;
IconData _lightIcon = Icons.light_mode;
IconData _darkIcon = Icons.dark_mode;
final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);
const Color barColor = Color.fromARGB(255, 255, 119, 0);

class About extends StatelessWidget {
  const About({super.key});

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
                            "O aplikaciji",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            textAlign: TextAlign.justify,
                            "Naša aplikacija za praćenje voznog reda buseva je revolucionarno rješenje koje olakšava putovanje gradskim prevozom. Bez obzira da li ste putnik koji svakodnevno koristi javni prevoz ili povremeni korisnik, naša aplikacija pruža sve informacije koje su vam potrebne da biste se kretali gradom efikasno i sa manje stresa.",
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            textAlign: TextAlign.justify,
                            "Glavni cilj naše aplikacije je da vam omogući brz pristup tačnim i ažuriranim informacijama o voznim redovima autobusa. Zahvaljujući integraciji sa sistemom javnog prevoza, možete pregledati raspored dolaska i odlaska autobusa na različitim stajalištima. Aplikacija koristi GPS tehnologiju kako bi vam pružila tačnu lokaciju autobusa u realnom vremenu, tako da možete precizno pratiti dolazak vašeg autobusa. Osim praćenja voznog reda, naša aplikacija takođe pruža dodatne funkcionalnosti koje čine putovanje gradskim prevozom prijatnijim iskustvom. Također, nudimo opciju planiranja putovanja, gde možete unijeti svoju polaznu i odredišnu točku, a aplikacija će vam pružiti najbolju rutu i preporuke za najpogodnije linije autobusa.",
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            textAlign: TextAlign.justify,
                            "Naš tim se stalno trudi da unaprijedi aplikaciju i pruži vam najbolje iskustvo korištenja. Radimo na dodavanju novih funkcionalnosti, kao što su obaveštenja u realnom vremenu o saobraćajnim gužvama ili kašnjenjima, kao i integracija sa drugim sistemima javnog prevoza kako bismo vam omogućili jednostavnije presedanje na druge linije. Uz našu aplikaciju za praćenje voznog reda buseva, putovanje gradom postaje jednostavnije, predvidljivije i efikasnije. Iskoristite prednosti moderne tehnologije i uživajte u sigurnom i udobnom putovanju javnim prevozom.",
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsetsDirectional.symmetric(
                          horizontal: 20,
                          vertical: 10,
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            textAlign: TextAlign.left,
                            "O autorima",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          launchURL(
                              "https://www.linkedin.com/in/antonio-jovi%C4%87-a0502326b?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_contact_details%3BK8elJrkpQteQ21SQP8e1QQ%3D%3D");
                        },
                        child: const Padding(
                          padding: EdgeInsetsDirectional.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              textAlign: TextAlign.justify,
                              "Antonio Jović",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          launchURL(
                              "https://www.linkedin.com/in/dea-noc-456a88215?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_contact_details%3BJd5N5KTeThm1nkLVN5q7IQ%3D%3D");
                        },
                        child: const Padding(
                          padding: EdgeInsetsDirectional.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              textAlign: TextAlign.justify,
                              "Dea Noč",
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
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

launchURL(url) async {
  Uri _url = Uri.parse(url);
  if (await launchUrl(_url)) {
    await launchUrl(_url);
  } else {
    throw 'Something went wrong!';
  }
}
