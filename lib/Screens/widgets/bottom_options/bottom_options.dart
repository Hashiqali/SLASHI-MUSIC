import 'package:flutter/material.dart';
import 'package:slashi_music/Screens/allsongs/allsongs.dart';
import 'package:slashi_music/Screens/favourite/favouritefunctions.dart';
import 'package:slashi_music/Screens/player/player.dart';
import 'package:slashi_music/Screens/widgets/bottom_options/bottomoptions.dart';
import 'package:slashi_music/Screens/widgets/showplaylist.dart';
import 'package:slashi_music/db/db_model/favourite_model/db_favourite_model.dart';
import 'package:slashi_music/db/db_model/playlist_model/playlist_model.dart';

void bottomoptions(
    [int? id,
    song,
    artist,
    int? index,
    player,
    uri,
    list,
    context,
    int? delete]) {
  showModalBottomSheet(
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
      return Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 46, 45, 45),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(35),
            topRight: Radius.circular(35),
          ),
        ),
        height: 280,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Options(artist: artist, id: id!, title: song),
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (ctx) {
                    return Player(
                      musicModelist: list,
                      audioplayer: allaudioPlayer,
                      index: index!,
                    );
                  }));
                },
                child: const SizedBox(
                  height: 50,
                  width: 370,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Image(
                        width: 30,
                        image: AssetImage('assets/images/play-circle (1).png'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Play',
                        style: TextStyle(
                          fontFamily: 'SLASHI',
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              delete == null
                  ? InkWell(
                      onTap: () {
                        final favo = Favourmodel(
                            artist: artist, image: id, title: song, uri: uri);
                        addingfavourite(context, favo);
                        Navigator.of(context).pop();
                      },
                      child: const SizedBox(
                        height: 50,
                        width: 370,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Image(
                              width: 30,
                              image: AssetImage('assets/images/heart.png'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Add to favourite',
                              style: TextStyle(
                                fontFamily: 'SLASHI',
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        favouritedelete(delete, context);

                        Navigator.of(context).pop();
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          duration: const Duration(seconds: 3),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor:
                              const Color.fromARGB(255, 31, 30, 30),
                          margin: const EdgeInsets.all(50),
                          content: Text(
                            'Removed from Favourite',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.orange.shade700,
                                fontFamily: 'SLASHI'),
                          ),
                        ));
                      },
                      child: const SizedBox(
                        height: 50,
                        width: 370,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 10,
                            ),
                            Image(
                              width: 30,
                              image: AssetImage('assets/images/heart.png'),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Remove from favourite',
                              style: TextStyle(
                                fontFamily: 'SLASHI',
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
              const SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  final data = Playlistmodel(
                      title: song, artist: artist, image: id, uri: uri);
                  showplaylistinbottomsheet(data, context);
                },
                child: const SizedBox(
                  height: 50,
                  width: 370,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Image(
                        width: 30,
                        image: AssetImage('assets/images/music-album.png'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Add to playlist',
                        style: TextStyle(
                          fontFamily: 'SLASHI',
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      );
    },
  );
}
