import 'dart:async';

import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:slashi_music/Screens/allsongs/allsongs.dart';
import 'package:slashi_music/Screens/favourite/favourite.dart';
import 'package:slashi_music/Screens/favourite/favouritefunctions.dart';
import 'package:slashi_music/Screens/player/player.dart';
import 'package:slashi_music/Screens/player/playerfunctions.dart';
import 'package:slashi_music/db/db_model/favourite_model/db_favourite_model.dart';

late StreamSubscription<Duration?> durationSubscription;
late StreamSubscription<Duration?> positionSubscription;
late StreamSubscription<PlayerState> playerStateSubscription;

// ignore: must_be_immutable
class Favbutton extends StatefulWidget {
  Favbutton({super.key, required this.musicModelist});
  List musicModelist;

  @override
  State<Favbutton> createState() => _FavbuttonState();
}

class _FavbuttonState extends State<Favbutton> {
  @override
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 1,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: InkWell(
          onTap: () async {
            var value = Favourmodel(
                title: widget.musicModelist[currentIndex].title,
                artist: widget.musicModelist[currentIndex].artist,
                image: widget.musicModelist[currentIndex].image,
                uri: widget.musicModelist[currentIndex].uri);
            idfav = await check(value);

            setState(() {
              isadded = !isadded;

              if (isadded == true) {
                addingfavour(context, value);
              } else if (isadded == false && idfav != 20000) {
                favouritedelete(idfav, context);
                getfavListFromHive();
              }
            });
          },
          child: isadded != true
              ? const Icon(
                  Icons.favorite_border_outlined,
                  color: Color.fromARGB(255, 255, 255, 255),
                  size: 30,
                )
              : const Icon(
                  Icons.favorite,
                  color: Color.fromARGB(255, 254, 17, 0),
                  size: 30,
                ),
        ),
      ),
    );
  }

  deletefav() async {
    if (n != null) {
      await allaudioPlayer.stop();
      if (isplaying == false) {
        await Future.delayed(const Duration(milliseconds: 400));
        // ignore: use_build_context_synchronously
        favouritedelete(idfav, context);
        getfavListFromHive();
// ignore: use_build_context_synchronously
        Navigator.of(context).pop();
      }
    }
  }
}
