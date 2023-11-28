import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:slashi_music/Screens/favourite/favourite.dart';
import 'package:slashi_music/Screens/widgets/snackbar.dart';
import 'package:slashi_music/db/db_model/favourite_model/db_favourite_model.dart';

ValueNotifier<List<Favourmodel>> favouNotifer = ValueNotifier([]);

addingfavourite(context, Favourmodel favo) async {
  final isAlreadyAdded = await isSongInfav(favo);
  if (!isAlreadyAdded) {
    favouriteadd(favo);
    snackbar('Added to Favourite', context);
  } else {
    snackbar('Already in favourite', context);
  }
}

Future<bool> isSongInfav(Favourmodel song) async {
  final favList = await getfavSongs();
  return favList.any((item) => item.uri == song.uri);
}

getfavSongs() async {
  final rece = await Hive.openBox<Favourmodel>('favourite');
  final List<Favourmodel> songList = rece.values.toList();
  return songList;
}

Future<void> favouritedelete(int? id, context) async {
  final favo = await Hive.openBox<Favourmodel>('favourite');
  favo.delete(id);
  snackbar('Removed from Favourite', context);
  // await getfavListFromHive();
  getallfavo();
}

Future<void> favouriteadd(Favourmodel value) async {
  final favo = await Hive.openBox<Favourmodel>('favourite');
  final _id = await favo.add(value);
  value.id = _id;
  favo.put(_id, value);
  await getfavListFromHive();
  getallfavo();
}

Future<void> getallfavo() async {
  final db = await Hive.openBox<Favourmodel>('favourite');
  favouNotifer.value.clear();
  await getfavListFromHive();
  favouNotifer.value.addAll(db.values);
  favouNotifer.notifyListeners();
}

getfavListFromHive() async {
  final favo = await Hive.openBox<Favourmodel>('favourite');
  final List<Favourmodel> songList = favo.values.toList();
  allfavourite.clear();
  favupdate.clear();
  favupdate.addAll(songList.reversed);
  allfavourite.addAll(songList);
}
