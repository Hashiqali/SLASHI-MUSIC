import 'package:flutter/material.dart';
import 'package:slashi_music/Screens/mostlyplayed/most_tile.dart';
import 'package:slashi_music/Screens/mostlyplayed/mostfunctions.dart';
import 'package:slashi_music/Screens/widgets/bodywidget.dart';
import 'package:slashi_music/db/db_model/music_model/db_model.dart';

class Mostly extends StatefulWidget {
  const Mostly({super.key});

  @override
  State<Mostly> createState() => _MostlyState();
}

class _MostlyState extends State<Mostly> {
  @override
  void initState() {
    getallmostplayed();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text(
          'Mostly Played',
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontFamily: 'SLASHI',
              fontWeight: FontWeight.w800),
        ),
      ),
      body: Body1(
          music: allmost,
          text: 'Most played songs',
          widget: const Mostplayedsongs()),
    );
  }
}

class Mostplayedsongs extends StatefulWidget {
  const Mostplayedsongs({super.key});

  @override
  State<Mostplayedsongs> createState() => _Mostplayedsongs();
}

List allmost = [];
List mostupdate = [];

class _Mostplayedsongs extends State<Mostplayedsongs> {
  @override
  void initState() {
    getallmostplayed();
    getSongListFromHive();
    super.initState();
  }

  @override
  void dispose() {
    allmost.clear();
    mostupdate.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: mostNotifier,
        builder:
            (BuildContext context, List<Musicmodel> musiclist, Widget? child) {
          final temp = musiclist.toList();
          musiclist = temp.toSet().toList();
          if (musiclist.isEmpty) {
            return const Center(
                child: Text(
              'No Songs',
              style: TextStyle(color: Colors.white, fontFamily: 'SLASHI'),
            ));
          }

          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ListView.separated(
              itemBuilder: (ctx, index) {
                final most = musiclist[index];
                return Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(40, 255, 255, 255),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    width: double.infinity,
                    height: 80,
                    child: MostTile(index: index, most: most),
                  ),
                );
              },
              separatorBuilder: (ctx, index) {
                return const SizedBox(
                  height: 7,
                );
              },
              itemCount: musiclist.length,
            ),
          );
        });
  }
}
