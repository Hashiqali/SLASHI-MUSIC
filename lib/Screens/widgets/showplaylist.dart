import 'package:flutter/material.dart';
import 'package:slashi_music/Screens/playlist/functions&others/playlist_functions.dart';
import 'package:slashi_music/Screens/playlist/playlist_operations/playlistcreate.dart';
import 'package:slashi_music/Screens/widgets/snackbar.dart';
import 'package:slashi_music/db/db_model/playlist_model/playlist_model.dart';

void showplaylistinbottomsheet(Playlistmodel values, context) {
  showModalBottomSheet(
      backgroundColor: const Color.fromARGB(0, 29, 29, 29),
      context: context,
      builder: (context) {
        return Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 49, 48, 48),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          height: 350,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: ValueListenableBuilder(
                valueListenable: playlistNotifier,
                builder: (context, play, child) {
                  final temp = play.reversed.toList();
                  play = temp.toList();
                  if (play.isEmpty) {
                    return Center(
                      child: GestureDetector(
                        onTap: () {
                          newplaylist(context);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 75, 74, 74),
                              borderRadius: BorderRadius.circular(50)),
                          width: double.infinity,
                          height: 50,
                          child: const Center(
                            child: Text(
                              'CREATE PLAYLIST',
                              style: TextStyle(
                                  fontFamily: 'SLASHI',
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return ListView.separated(
                        itemBuilder: (ctx, index) {
                          final playli = play[index];

                          return GestureDetector(
                            onTap: () async {
                              if (!playli.songsList!.any(
                                  (element) => element.uri == values.uri)) {
                                addsongsTolist(
                                    playli.id!,
                                    playli.name!,
                                    playli.idlist ??= 100,
                                    playli.songsList ?? [],
                                    values);
                                // ignore: use_build_context_synchronously
                                snackbar('Added to Playlist', context);
                                // ignore: use_build_context_synchronously
                                Navigator.of(context).pop();
                              } else {
                                // ignore: use_build_context_synchronously
                                snackbar('Already in Playlist', context);
                                // ignore: use_build_context_synchronously
                                Navigator.of(context).pop();
                              }
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: const Color.fromARGB(255, 75, 74, 74),
                                  borderRadius: BorderRadius.circular(50)),
                              width: double.infinity,
                              height: 50,
                              child: Center(
                                child: Text(
                                  playli.name ?? 'hello',
                                  style: const TextStyle(
                                      fontFamily: 'SLASHI',
                                      fontSize: 20,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (ctx, index) {
                          return const SizedBox(
                            height: 10,
                          );
                        },
                        itemCount: play.length);
                  }
                }),
          ),
        );
      });
}
