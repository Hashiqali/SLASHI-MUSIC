import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:provider/provider.dart';
import 'package:slashi_music/Screens/splash&welcome/splash.dart';
import 'package:slashi_music/db/db_model/favourite_model/db_favourite_model.dart';
import 'package:slashi_music/db/db_model/music_model/db_model.dart';
import 'package:slashi_music/db/db_model/playlist_model/playlist_model.dart';
import 'package:slashi_music/provider/song_model_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  Hive.registerAdapter(MusicmodelAdapter());
  Hive.registerAdapter(FavourmodelAdapter());
  Hive.registerAdapter(PlaylistmodelAdapter());
  await Hive.openBox<Playlistmodel>('playlist');
  await Hive.openBox<Musicmodel>('recent');
  await Hive.openBox<Favourmodel>('favourite');
  await Hive.openBox<Musicmodel>('most');
  await Hive.openBox<Musicmodel>('mostsongs');

  runApp(ChangeNotifierProvider(
    create: (context) => Songmodelprovider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.orange.shade700,
          drawerTheme: const DrawerThemeData(backgroundColor: Colors.black)),
      home: const Splash(),
    );
  }
}
