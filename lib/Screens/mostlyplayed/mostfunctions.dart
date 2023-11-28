import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:slashi_music/Screens/mostlyplayed/mostlyplayed.dart';
import 'package:slashi_music/db/db_model/music_model/db_model.dart';

ValueNotifier<List<Musicmodel>> mostNotifier = ValueNotifier([]);

getallmostplayed() async {
  final mostsongs = await Hive.openBox<Musicmodel>('mostsongs');
  mostNotifier.value.clear();
  print(mostsongs.values);
  print(mostplayed);
  mostNotifier.value.addAll(mostsongs.values);
  mostNotifier.notifyListeners();
}

addmostsongs(Musicmodel value) async {
  final mostsongs = await Hive.openBox<Musicmodel>('mostsongs');
  final _id = await mostsongs.add(value);
  value.id = _id;
  await mostsongs.put(_id, value);
  getallmostplayed();
  getSongListFromHive();
}

Future<void> deletemostplayed(int id) async {
  final mostsongs = await Hive.openBox<Musicmodel>('mostsongs');
  await mostsongs.deleteAt(id);
  getallmostplayed();
  getSongListFromHive();
}

List mostplayed = [];

mostfunctions(value) async {
  mostplayed.add(value);
  int playcount = 0;
  for (var i in mostplayed) {
    if (i.uri == value.uri) {
      playcount++;
    }
  }
  if (playcount == 3) {
    final most = await Hive.openBox<Musicmodel>('mostsongs');
    if (!most.values.any((element) => element.uri == value.uri)) {
      await addmostsongs(value);
      mostplayed.remove(value);
    }
  }
}

//gethivesongsforadd the all music list
getSongListFromHive() async {
  final rece = await Hive.openBox<Musicmodel>('mostsongs');
  final List<Musicmodel> songList = rece.values.toList();
  mostupdate.clear();
  allmost.clear();
  mostupdate.addAll(songList);
  allmost.addAll(songList.reversed);
}
