import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:slashi_music/Screens/mostlyplayed/mostlyplayed.dart';
import 'package:slashi_music/Screens/settings/about.dart';
import 'package:slashi_music/Screens/settings/privacy.dart';
import 'package:slashi_music/Screens/settings/terms.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(35),
        bottomRight: Radius.circular(35),
      ),
      child: Drawer(
        backgroundColor: const Color.fromARGB(255, 15, 14, 14),
        surfaceTintColor: const Color.fromARGB(255, 82, 82, 82),
        elevation: 10,
        width: 280,
        child: SafeArea(
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                      flex: 9,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(left: 25),
                                child: Text(
                                  'Settings',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 203, 200, 200),
                                      fontSize: 25,
                                      fontFamily: 'SLASHI',
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                              Row(
                                children: [
                                  Builder(builder: (BuildContext context) {
                                    return IconButton(
                                        onPressed: () {
                                          Scaffold.of(context).closeDrawer();
                                        },
                                        icon: const Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          color: Color.fromARGB(
                                              255, 203, 200, 200),
                                        ));
                                  }),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Ink(
                            height: 60,
                            width: 300,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => const Mostly(),
                                ));
                              },
                              child: const Row(
                                children: [
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Text(
                                    'Mostly Played',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 203, 200, 200),
                                        fontSize: 17,
                                        fontFamily: 'SLASHI',
                                        fontWeight: FontWeight.w800),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.my_library_music,
                                    color: Color.fromARGB(255, 203, 200, 200),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Ink(
                            height: 60,
                            width: 300,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => const Privacy(),
                                ));
                              },
                              child: const Row(
                                children: [
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Text(
                                    'Privacy and Policy',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 203, 200, 200),
                                        fontSize: 17,
                                        fontFamily: 'SLASHI',
                                        fontWeight: FontWeight.w800),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Ink(
                            height: 60,
                            width: 300,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => const Terms(),
                                ));
                              },
                              child: const Row(
                                children: [
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Text(
                                    'Terms and Conditions ',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 203, 200, 200),
                                        fontFamily: 'SLASHI',
                                        fontSize: 17,
                                        fontWeight: FontWeight.w800),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Ink(
                            height: 60,
                            width: 300,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) => const About(),
                                ));
                              },
                              child: const Row(
                                children: [
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Text(
                                    'About',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 203, 200, 200),
                                        fontFamily: 'SLASHI',
                                        fontSize: 17,
                                        fontWeight: FontWeight.w800),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Ink(
                            height: 60,
                            width: 300,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).pop();
                                Share.share('SLASHI MUSIC');
                              },
                              child: const Row(
                                children: [
                                  SizedBox(
                                    width: 25,
                                  ),
                                  Text(
                                    'Share',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 203, 200, 200),
                                        fontSize: 17,
                                        fontFamily: 'SLASHI',
                                        fontWeight: FontWeight.w800),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.share,
                                    color: Color.fromARGB(255, 203, 200, 200),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                  Flexible(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Text(
                            'Version 1.1v',
                            style: TextStyle(
                                color: Colors.orange.shade700,
                                fontSize: 13,
                                fontFamily: 'SLASHI'),
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
