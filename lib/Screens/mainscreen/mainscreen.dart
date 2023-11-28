import 'package:flutter/material.dart';
import 'package:slashi_music/Screens/favourite/favouritefunctions.dart';
import 'package:slashi_music/Screens/mainscreen/drawer/drawer.dart';
import 'package:slashi_music/Screens/mainscreen/tab_controller/tab_bar.dart';
import 'package:slashi_music/Screens/mostlyplayed/mostfunctions.dart';
import 'package:slashi_music/Screens/playlist/functions&others/playlist_functions.dart';
import 'package:slashi_music/Screens/recent/recentfunctions.dart';
import '../search/search.dart';

class Maniscreen extends StatefulWidget {
  const Maniscreen({
    super.key,
  });

  @override
  State<Maniscreen> createState() => _ManiscreenState();
}

class _ManiscreenState extends State<Maniscreen> {
  bool isvalue = false;
  int current = 0;
  @override
  void initState() {
    initialfunction();
    super.initState();
  }

  initialfunction() async {
    await getallmostplayed();
    await getallplaylist();
    await getallfavo();
    await getallmusic();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const DrawerWidget(),
      body: Stack(
        children: [
          Tabbar(key1: _scaffoldKey),
          const Positioned(
              bottom: -3,
              left: -3,
              child: Image(
                  width: 115,
                  image:
                      AssetImage('assets/images/cutt-removebg-preview.png'))),
          Positioned(
            top: -155,
            right: -138,
            child: Container(
              height: 300,
              width: 300,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/top.png'),
                      fit: BoxFit.cover)),
            ),
          ),
          Positioned(
              top: 62,
              left: 270,
              child: InkWell(
                onTap: () {
                  showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(),
                  );
                },
                child: Container(
                  height: 50,
                  width: 100,
                  color: Colors.transparent,
                ),
              )),
        ],
      ),
    );
  }
}
