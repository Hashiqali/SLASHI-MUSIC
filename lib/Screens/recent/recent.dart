import 'package:flutter/material.dart';
import 'package:slashi_music/Screens/widgets/List_tile.dart';
import 'package:slashi_music/Screens/widgets/bodywidget.dart';
import 'package:slashi_music/Screens/recent/recentfunctions.dart';
import 'package:slashi_music/db/db_fetch/db_fetchmusic.dart';
import 'package:slashi_music/db/db_model/music_model/db_model.dart';

class Recent extends StatefulWidget {
  const Recent({super.key});

  @override
  State<Recent> createState() => _RecentState();
}

class _RecentState extends State<Recent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Body1(
            music: allrecent, text: 'All Recent', widget: const Recentsongs()));
  }
}

class Recentsongs extends StatefulWidget {
  const Recentsongs({super.key});

  @override
  State<Recentsongs> createState() => _RecentsongsState();
}

List allrecent = [];
List recentupdate = [];

class _RecentsongsState extends State<Recentsongs> {
  @override
  void initState() {
    getallrecentFromHive();
    super.initState();
  }

  @override
  void dispose() {
    allrecent.clear();
    recentupdate.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: musicNotifer,
        builder:
            (BuildContext context, List<Musicmodel> musiclist, Widget? child) {
          final temp = musiclist.reversed.toList();
          musiclist = temp.toSet().toList();

          if (musiclist.isEmpty) {
            return const Center(
                child: Text(
              'No Recents',
              style: TextStyle(color: Colors.white, fontFamily: 'SLASHI'),
            ));
          }

          return ListView.separated(
            itemBuilder: (ctx, index) {
              final recent = musiclist[index];
              return ListTilewidget(
                  index: index, value: recent, allsongs: recentupdate);
            },
            separatorBuilder: (ctx, index) {
              return const SizedBox(
                height: 7,
              );
            },
            itemCount: musiclist.length,
          );
        });
  }
}
