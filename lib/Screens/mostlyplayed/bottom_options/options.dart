import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:slashi_music/Screens/allsongs/allsongs.dart';
import 'package:slashi_music/Screens/favourite/favouritefunctions.dart';
import 'package:slashi_music/Screens/mostlyplayed/mostfunctions.dart';
import 'package:slashi_music/Screens/mostlyplayed/mostlyplayed.dart';
import 'package:slashi_music/Screens/player/player.dart';
import 'package:slashi_music/Screens/widgets/showplaylist.dart';
import 'package:slashi_music/Screens/widgets/snackbar.dart';
import 'package:slashi_music/db/db_model/favourite_model/db_favourite_model.dart';
import 'package:slashi_music/db/db_model/playlist_model/playlist_model.dart';

void mostoptions(
    int id, song, artist, int index, player, uri, int deleteid, context) {
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
        height: 340,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 5,
                  ),
                  QueryArtworkWidget(
                    id: id,
                    type: ArtworkType.AUDIO,
                    artworkHeight: 60,
                    artworkWidth: 60,
                    artworkFit: BoxFit.fill,
                    artworkQuality: FilterQuality.high,
                    artworkBorder: BorderRadius.circular(30),
                    quality: 100,
                    nullArtworkWidget: const Image(
                        width: 60,
                        image:
                            AssetImage('assets/images/Play_Music_30003.png')),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 40),
                          child: Text(
                            song,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                              color: Colors.white,
                              fontFamily: 'SLASHI',
                              fontSize: 20,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Text(
                          artist,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                            color: Colors.white,
                            fontFamily: 'SLASHI',
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Divider(
                  color: Color.fromARGB(68, 255, 255, 255),
                  thickness: 2,
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushReplacement(MaterialPageRoute(builder: (ctx) {
                    return Player(
                      musicModelist: mostupdate,
                      audioplayer: allaudioPlayer,
                      index: index,
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
              InkWell(
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
              InkWell(
                onTap: () {
                  deletemostplayed(deleteid);
                  snackbar('Removed from Mostplayed', context);
                  Navigator.of(context).pop();
                },
                child: SizedBox(
                  height: 50,
                  width: 370,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.delete_rounded,
                        size: 30,
                        color: Colors.orange.shade700,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Remove from Mostplayed',
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
