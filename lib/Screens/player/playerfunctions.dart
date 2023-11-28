import 'package:hive_flutter/hive_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slashi_music/Screens/favourite/favouritefunctions.dart';
import 'package:slashi_music/Screens/player/player.dart';
import 'package:slashi_music/Screens/widgets/snackbar.dart';
import 'package:slashi_music/db/db_model/favourite_model/db_favourite_model.dart';

List favcheck = [];

check(Favourmodel value) async {
  await getRecentSongs();
  int? c;
  for (int i = 0; i < favcheck.length; i++) {
    if (value.uri == favcheck[i].uri) {
      c = favcheck[i].id;
      break;
    }
  }
  favcheck.clear();
  return c;
}

getRecentSongs() async {
  final rece = await Hive.openBox<Favourmodel>('favourite');
  favcheck = rece.values.toList();
}

Future<bool> isSongInRecent(Favourmodel song) async {
  final favList = await getfavSongs();
  return favList.any((item) => item.uri == song.uri);
}

getfavSongs() async {
  final rece = await Hive.openBox<Favourmodel>('favourite');
  final List<Favourmodel> songList = rece.values.toList();
  return songList;
}

addingfavour(context, Favourmodel favo) async {
  final isAlreadyAdded = await isSongInRecent(favo);
  if (!isAlreadyAdded) {
    favouriteadd(favo);
    snackbar('Added to Favourite', context);
  }
}

changeseconds(int seconds, audioplayer) {
  Duration duration = Duration(seconds: seconds);
  audioplayer.seek(duration);
}

Future<void> getfavcontains(data) async {
  final rece = await Hive.openBox<Favourmodel>('favourite');
  final List<Favourmodel> songList = rece.values.toList();
  if (songList.isEmpty) {
    isadded = false;
  } else {
    var value = Favourmodel(
        title: data.title,
        artist: data.artist,
        image: data.image,
        uri: data.uri);
    isadded = songList.any((song) => song.uri == value.uri);
  }
}

Future<Duration> getStoredPlaybackPosition(String uri) async {
  final prefs = await SharedPreferences.getInstance();
  final storedPosition = prefs.getInt('playback_position_$uri') ?? 0;
  return Duration(seconds: storedPosition);
}

Future<void> savePlaybackPosition(String uri, Duration position) async {
  final prefs = await SharedPreferences.getInstance();
  prefs.setInt('playback_position_$uri', position.inSeconds);
}
