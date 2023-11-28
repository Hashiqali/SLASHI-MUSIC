import 'package:flutter/material.dart';
import 'package:slashi_music/Screens/playlist/functions&others/playlistTile.dart';
import 'package:slashi_music/Screens/playlist/functions&others/playlist_functions.dart';
import 'package:slashi_music/Screens/playlist/playlist_operations/playlistcreate.dart';
import 'package:slashi_music/db/db_model/playlist_model/playlist_model.dart';

class Playlist extends StatelessWidget {
  const Playlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 0, 0, 0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'All Playlist',
                    style: TextStyle(
                      fontFamily: 'SLASHI',
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          newplaylist(context);
                        },
                        child: const Image(
                          width: 30,
                          image: AssetImage('assets/images/queue.png'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Expanded(child: Playlists()),
          ],
        ),
      ),
    );
  }
}

class Playlists extends StatefulWidget {
  const Playlists({super.key});

  @override
  State<Playlists> createState() => _Playlists();
}

class _Playlists extends State<Playlists> {
  @override
  void initState() {
    getallplaylistfromHive();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: playlistNotifier,
        builder: (BuildContext context, List<Playlistmodel> playlist,
            Widget? child) {
          final temp = playlist.reversed.toList();
          playlist = temp.toList();

          return playlist.isEmpty
              ? const Center(
                  child: Text(
                    'No Playlist',
                    style: TextStyle(color: Colors.white, fontFamily: 'SLASHI'),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 5.0,
                      mainAxisSpacing: 5.0,
                    ),
                    itemCount: playlist.length,
                    itemBuilder: (context, index) {
                      final data = playlist[index];
                      final img = data.songsList!.take(4).toList();
                      return Gridtile(data: data, img: img);
                    },
                  ),
                );
        });
  }
}
