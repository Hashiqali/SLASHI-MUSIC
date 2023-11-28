import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:provider/provider.dart';
import 'package:slashi_music/provider/song_model_provider.dart';

class ArtWorkWidget extends StatelessWidget {
  const ArtWorkWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return QueryArtworkWidget(
      id: context.watch<Songmodelprovider>().id,
      type: ArtworkType.AUDIO,
      artworkHeight: MediaQuery.of(context).size.width / 1.5,
      artworkWidth: MediaQuery.of(context).size.width / 1.2,
      artworkFit: BoxFit.fill,
      artworkQuality: FilterQuality.high,
      artworkBorder: BorderRadius.circular(15),
      quality: 100,
      nullArtworkWidget: Image(
          height: MediaQuery.of(context).size.width / 1.5,
          width: MediaQuery.of(context).size.width / 1.5,
          image: const AssetImage('assets/images/Play_Music_30003.png')),
    );
  }
}

// ignore: must_be_immutable
class Artoption extends StatelessWidget {
  Artoption({super.key, required this.id});
  int id;
  @override
  Widget build(BuildContext context) {
    return QueryArtworkWidget(
      id: id,
      type: ArtworkType.AUDIO,
      artworkHeight: 60,
      artworkWidth: 60,
      artworkFit: BoxFit.fill,
      artworkQuality: FilterQuality.high,
      artworkBorder: BorderRadius.circular(30),
      quality: 100,
      nullArtworkWidget: const Image(
          width: 60, image: AssetImage('assets/images/Play_Music_30003.png')),
    );
  }
}
