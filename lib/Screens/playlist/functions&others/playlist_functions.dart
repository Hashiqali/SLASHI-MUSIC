import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:slashi_music/Screens/playlist/playlistsongs/playlistsongs.dart';
import 'package:slashi_music/db/db_model/playlist_model/playlist_model.dart';

ValueNotifier<List<Playlistmodel>> playlistNotifier = ValueNotifier([]);

Future<void> addplaylist(Playlistmodel playlistvalue) async {
  final db = await Hive.openBox<Playlistmodel>('playlist');
  final _id = await db.add(playlistvalue);
  playlistvalue.id = _id;
  db.put(_id, playlistvalue);
  getallplaylist();
}

Future<void> getallplaylist() async {
  final db = await Hive.openBox<Playlistmodel>('playlist');
  playlistNotifier.value.clear();
  playlistNotifier.value.addAll(db.values);
  playlistNotifier.notifyListeners();
}

Future<void> playlistedit(Playlistmodel value, int idlist) async {
  final db = await Hive.openBox<Playlistmodel>('playlist');
  await db.put(idlist, value);
  await getallplaylist();
}

Future<void> playlistdelete(int id) async {
  final db = await Hive.openBox<Playlistmodel>('playlist');
  await db.delete(id);
  getallplaylist();
}

Future<void> addsongsTolist(
    int id, String name, int id1, list, Playlistmodel value) async {
  final db = await Hive.openBox<Playlistmodel>('playlist');
  value.idlist = id1 + 1;
  value.id = id;
  if (!list.any((item) => item.uri == value.uri)) {
    list.add(value);
    final a =
        Playlistmodel(id: id, name: name, songsList: list, idlist: id1 + 1);
    await db.put(id, a);
  }
  getallplaylist();
}

deleteplaylistsongs(list, int idlist, int index, name, int id) async {
  final db = await Hive.openBox<Playlistmodel>('playlist');
  list.removeAt(index);
  final a = Playlistmodel(id: id, name: name, songsList: list, idlist: idlist);
  await db.put(id, a);
  getallplaylistfromHive();
  getallplaylist();
}

getallplaylistfromHive() async {
  final db = await Hive.openBox<Playlistmodel>('playlist');
  List songList = [];
  for (var i in db.values) {
    songList = i.songsList!;
  }
  songList = songList.reversed.toList();
  playlistsongslist.clear();
  playlistsongslist.addAll(songList);
}
