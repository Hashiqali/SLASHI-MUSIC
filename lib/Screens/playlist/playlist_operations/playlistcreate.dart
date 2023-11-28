// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:slashi_music/Screens/playlist/functions&others/playlist_functions.dart';
import 'package:slashi_music/Screens/widgets/snackbar.dart';
import 'package:slashi_music/db/db_model/playlist_model/playlist_model.dart';

final playlistnamecontroller = TextEditingController();
final GlobalKey<FormState> formkey = GlobalKey<FormState>();

List a = [];
void newplaylist(context) async {
  getplaylistSongs();
  showDialog(
    context: context,
    builder: (ctx) {
      return SimpleDialog(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        surfaceTintColor: const Color.fromARGB(166, 167, 166, 166),
        backgroundColor: const Color.fromARGB(162, 0, 0, 0),
        children: [
          SimpleDialogOption(
            child: Text('New Playlist',
                style: TextStyle(
                    fontFamily: 'SLASHI',
                    color: Colors.orange.shade700,
                    fontSize: 15)),
          ),
          const SizedBox(
            height: 8,
          ),
          SimpleDialogOption(
            child: Form(
              key: formkey,
              child: TextFormField(
                controller: playlistnamecontroller,
                maxLength: 10,
                decoration: InputDecoration(
                    counterStyle: const TextStyle(color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    prefixIcon: const Icon(Icons.playlist_play_outlined),
                    labelText: 'Playlist Name',
                    labelStyle: const TextStyle(
                        fontFamily: 'SLASHI',
                        color: Color.fromARGB(217, 255, 255, 255)),
                    fillColor: const Color.fromARGB(255, 124, 123, 123),
                    filled: true),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter Playlist Name';
                  } else if (a.contains(value)) {
                    return 'Name is already in playlist';
                  }
                  return null;
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () {
                    playlistnamecontroller.clear();
                    Navigator.pop(context);
                  },
                  child: Text(
                    'CANCEL',
                    style: TextStyle(color: Colors.orange.shade700),
                  )),
              TextButton(
                onPressed: () async {
                  if (formkey.currentState!.validate()) {
                    okpressing(context);
                    snackbar('Playlist created', context);
                  }
                },
                child: Text(
                  'OK',
                  style: TextStyle(color: Colors.orange.shade700),
                ),
              )
            ],
          ),
        ],
      );
    },
  );
}

Future<void> okpressing(context) async {
  final name = playlistnamecontroller.text.trim();
  final music = Playlistmodel(name: name, songsList: []);

  if (name.isEmpty) {
    return;
  } else {
    await addplaylist(music);
    playlistnamecontroller.clear();
    Navigator.pop(context);
  }
}

getplaylistSongs() async {
  final db = await Hive.openBox<Playlistmodel>('playlist');
  a.clear();
  for (var i in db.values) {
    a.add(i.name!);
  }
}
