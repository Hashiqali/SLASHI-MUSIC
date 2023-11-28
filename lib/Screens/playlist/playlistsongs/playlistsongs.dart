import 'package:flutter/material.dart';
import 'package:slashi_music/Screens/playlist/functions&others/playlist_functions.dart';
import 'package:slashi_music/Screens/playlist/playlistsongs/songs_tile.dart';
import 'package:slashi_music/Screens/widgets/bodywidget.dart';

List playlistsongslist = [];

// ignore: must_be_immutable
class Playlistsongs extends StatefulWidget {
  Playlistsongs({
    super.key,
    required this.songid,
    required this.name,
  });

  List songid;
  String? name;

  @override
  State<Playlistsongs> createState() => _PlaylistsongsState();
}

class _PlaylistsongsState extends State<Playlistsongs> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: Text(
          widget.name ?? 'hello',
          style: const TextStyle(color: Colors.white, fontFamily: 'SLASHI'),
        ),
        centerTitle: true,
      ),
      body: Body1(
          music: playlistsongslist,
          text: 'All songs',
          widget: Playlistsongs1(all: playlistsongslist, name: widget.name!)),
    );
  }
}

// ignore: must_be_immutable
class Playlistsongs1 extends StatefulWidget {
  Playlistsongs1({super.key, required this.all, required this.name});
  List all;
  String name;

  @override
  State<Playlistsongs1> createState() => _Playlistsongs1();
}

class _Playlistsongs1 extends State<Playlistsongs1> {
  @override
  void initState() {
    getallplaylistfromHive();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.all.isEmpty
        ? const Center(
            child: Text(
            'No Songs',
            style: TextStyle(color: Colors.white, fontFamily: 'SLASHI'),
          ))
        : Songstile(all: widget.all, name: widget.name);
  }
}
