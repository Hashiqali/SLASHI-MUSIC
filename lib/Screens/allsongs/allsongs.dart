import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:just_audio/just_audio.dart';
import 'package:slashi_music/Screens/widgets/List_tile.dart';
import 'package:slashi_music/Screens/widgets/bodywidget.dart';
import 'package:slashi_music/db/db_fetch/db_fetchmusic.dart';
import 'package:slashi_music/db/db_model/music_model/db_model.dart';

class SongsList extends StatefulWidget {
  const SongsList({super.key});

  @override
  State<SongsList> createState() => _SongsListState();
}

class _SongsListState extends State<SongsList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body1(music: allmusic, text: 'All songs', widget: const Songs()),
    );
  }
}

final allaudioPlayer = AudioPlayer();
List<Musicmodel> allmusic = [];

class Songs extends StatefulWidget {
  const Songs({super.key});

  @override
  State<Songs> createState() => _SongsState();
}

class _SongsState extends State<Songs> with WidgetsBindingObserver {
  @override
  void initState() {
    refreshSongsList();
    super.initState();
  }

  @override
  void dispose() {
    allmusic.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Box<Musicmodel>>(
      future: Hive.openBox<Musicmodel>('songs'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
              child: Text('Please wait',
                  style: TextStyle(
                      fontFamily: 'SLASHI',
                      color: Colors.orange.shade700,
                      fontSize: 15)));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(
              child: Text(
            'No songs',
            style: TextStyle(color: Colors.white, fontFamily: 'SLASHI'),
          ));
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else {
          final songBox = snapshot.data;

          final songs = songBox!.values.toList();
          songs.sort(
              (a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()));

          // allmusic.addAll(songs.reversed);
          return Scrollbar(
            thickness: 1,
            radius: const Radius.circular(10),
            child: RefreshIndicator(
              onRefresh: _refresh,
              child: ListView.separated(
                itemBuilder: (ctx, index) {
                  final song = songs[index];
                  return ListTilewidget(
                    index: index,
                    value: song,
                    allsongs: allmusic.reversed.toList(),
                  );
                },
                separatorBuilder: (ctx, index) {
                  return const SizedBox(
                    height: 7,
                  );
                },
                itemCount: songs.length,
              ),
            ),
          );
        }
      },
    );
  }

  Future<void> _refresh() async {
    await fetchSongs();
    refreshSongsList();
    setState(() {});
    Future.delayed(const Duration(seconds: 2));
  }

  Future<void> refreshSongsList() async {
    final songBox = await Hive.openBox<Musicmodel>('songs');
    final songs = songBox.values.toList();
    songs
        .sort((a, b) => a.title.toLowerCase().compareTo(b.title.toLowerCase()));

    setState(() {
      allmusic.clear();
      allmusic.addAll(songs.reversed);
    });
  }
}
