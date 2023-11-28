import 'package:flutter/material.dart';
import 'package:slashi_music/Screens/widgets/List_tile.dart';
import 'package:slashi_music/Screens/widgets/bodywidget.dart';
import 'package:slashi_music/Screens/favourite/favouritefunctions.dart';
import 'package:slashi_music/db/db_model/favourite_model/db_favourite_model.dart';

class Favourite extends StatefulWidget {
  const Favourite({super.key});

  @override
  State<Favourite> createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  void initState() {
    getfavListFromHive();
    super.initState();
  }

  @override
  void dispose() {
    allfavourite.clear();
    favupdate.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Body1(
            music: allfavourite,
            text: 'All Favourite',
            widget: const Favouritesongs()));
  }
}

List allfavourite = [];
List favupdate = [];

class Favouritesongs extends StatefulWidget {
  const Favouritesongs({super.key});

  @override
  State<Favouritesongs> createState() => _Favouritesongs();
}

class _Favouritesongs extends State<Favouritesongs> {
  @override
  void initState() {
    getallfavo();
    getfavListFromHive();
    super.initState();
  }

  @override
  void dispose() {
    allfavourite.clear();
    favupdate.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: favouNotifer,
        builder:
            (BuildContext context, List<Favourmodel> favoulist, Widget? child) {
          final temp = favoulist.reversed.toList();
          favoulist = temp.toSet().toList();

          if (favoulist.isEmpty) {
            return const Center(
                child: Text(
              'No Favourites',
              style: TextStyle(color: Colors.white, fontFamily: 'SLASHI'),
            ));
          }
          return ListView.separated(
            itemBuilder: (ctx, index) {
              final allfavo = favoulist[index];

              return ListTilewidget(
                  index: index, value: allfavo, allsongs: favupdate, i: 1);
            },
            separatorBuilder: (ctx, index) {
              return const SizedBox(
                height: 7,
              );
            },
            itemCount: favoulist.length,
          );
        });
  }
}
