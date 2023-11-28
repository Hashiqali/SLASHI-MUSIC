import 'package:flutter/material.dart';
import 'package:slashi_music/Screens/allsongs/allsongs.dart';
import 'package:slashi_music/Screens/player/player.dart';
import 'package:slashi_music/Screens/playlist/functions&others/playlist_functions.dart';
import 'package:slashi_music/Screens/playlist/playlist_operations/playlistcreate.dart';
import 'package:slashi_music/Screens/playlist/playlist_operations/playlistupdate.dart';
import 'package:slashi_music/Screens/widgets/snackbar.dart';

void playlistBottomoptions(id, name, list, context) {
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
        height: 260,
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    'Back',
                    style: TextStyle(color: Colors.white),
                  )),
              const Padding(
                padding: EdgeInsets.only(left: 10, right: 10),
                child: Divider(
                  color: Color.fromARGB(68, 255, 255, 255),
                  thickness: 2,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              InkWell(
                onTap: () {
                  if (list.isNotEmpty) {
                    Navigator.of(context)
                        .pushReplacement(MaterialPageRoute(builder: (ctx) {
                      return Player(
                          musicModelist: list.reversed.toList(),
                          audioplayer: allaudioPlayer,
                          index: list.indexOf(list.first));
                    }));
                  } else {
                    Navigator.of(context).pop();
                    snackbar('No songs', context);
                  }
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
                  getplaylistSongs();
                  updateplaylist(id, name, list, context);
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
                        Icons.edit,
                        color: Colors.orange.shade700,
                        size: 30,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        'Edit playlist',
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
                  playlistdelete(id);
                  snackbar('Removed from Playlist', context);
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
                        image: AssetImage('assets/images/trash.png'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Remove playlist',
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
