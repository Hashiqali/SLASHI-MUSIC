import 'package:hive_flutter/hive_flutter.dart';
import 'package:slashi_music/Screens/recent/recent.dart';
import 'package:slashi_music/db/db_fetch/db_fetchmusic.dart';
import 'package:slashi_music/db/db_model/music_model/db_model.dart';

recentfunction(Musicmodel value) async {
  final recent = await Hive.openBox<Musicmodel>('recent');

  final data = recent.values.firstWhere(
    (element) => element.uri == value.uri,
    orElse: () {
      return Musicmodel(title: '', artist: '', image: 0, uri: '');
    },
  );
  if (data.uri == value.uri) {
    await Future.delayed(const Duration(seconds: 1));
    recentdelete(data.id!);
    recentadd(value);
  } else {
    recentadd(value);
  }
}

recentadd(Musicmodel value) async {
  final recent = await Hive.openBox<Musicmodel>('recent');
  final id1 = await recent.add(value);
  value.id = id1;
  recent.put(id1, value);
  getallmusic();
}

recentdelete(int id) async {
  final recent = await Hive.openBox<Musicmodel>('recent');
  recent.delete(id);
  getallmusic();
}

Future<void> getallmusic() async {
  final db = await Hive.openBox<Musicmodel>('recent');
  musicNotifer.value.clear();
  musicNotifer.value.addAll(db.values);
  musicNotifer.notifyListeners();
}

getallrecentFromHive() async {
  final rece = await Hive.openBox<Musicmodel>('recent');
  List<Musicmodel> songList = rece.values.toList();
  songList = songList.reversed.toList();
  allrecent.clear();
  recentupdate.clear();
  recentupdate.addAll(songList);
  allrecent.addAll(songList.reversed);
}
