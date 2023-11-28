import 'package:flutter/material.dart';
import 'package:slashi_music/Screens/playlist/functions&others/playlist_functions.dart';
import 'package:slashi_music/Screens/playlist/playlist_operations/playlistcreate.dart';
import 'package:slashi_music/Screens/widgets/snackbar.dart';
import 'package:slashi_music/db/db_model/playlist_model/playlist_model.dart';

void updateplaylist(id, name, list, context) {
  getplaylistSongs();
  TextEditingController editcontroller = TextEditingController(text: name);
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
                controller: editcontroller,
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
                      color: Color.fromARGB(255, 81, 80, 80),
                    ),
                    fillColor: Colors.white,
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
                    editcontroller.clear();
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'CANCEL',
                    style: TextStyle(color: Colors.orange.shade700),
                  )),
              TextButton(
                onPressed: () {
                  if (formkey.currentState!.validate()) {
                    okbuttompress(editcontroller, id, list, context);
                    snackbar('Playlist Updated', context);
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

Future<void> okbuttompress(name1, id, list, context) async {
  if (name1 == null) {
    return;
  }
  final name = name1.text.trim();
  if (name.isEmpty) {
    return;
  } else {
    final value = Playlistmodel(name: name, id: id, songsList: list);
    await playlistedit(value, id);
    name1.clear();
    Navigator.of(context).pop();
    Navigator.of(context).pop();
  }
}
