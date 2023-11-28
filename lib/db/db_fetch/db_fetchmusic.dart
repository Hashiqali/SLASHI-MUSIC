import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:slashi_music/db/db_model/music_model/db_model.dart';

ValueNotifier<List<Musicmodel>> musicNotifer = ValueNotifier([]);

final OnAudioQuery onAudioQuery = OnAudioQuery();
Future<void> fetchSongs() async {
  await onAudioQuery.permissionsStatus();
  final songs = await onAudioQuery.querySongs();

  final songBox = await Hive.openBox<Musicmodel>('songs');

  for (final song in songs) {
    final hiveSong = Musicmodel(
      uri: song.uri,
      image: song.id,
      title: song.displayNameWOExt,
      artist: song.artist ?? '',
    );

    await songBox.put(song.id, hiveSong);
  }
}
