import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

// ignore: must_be_immutable
class Artlist extends StatelessWidget {
  Artlist({super.key, required this.image});
  int image;
  @override
  Widget build(BuildContext context) {
    return QueryArtworkWidget(
      id: image,
      type: ArtworkType.AUDIO,
      artworkHeight: 50,
      artworkWidth: 50,
      artworkFit: BoxFit.fill,
      artworkQuality: FilterQuality.high,
      artworkBorder: BorderRadius.circular(5),
      quality: 100,
      nullArtworkWidget: const Image(
          width: 50, image: AssetImage('assets/images/Play_Music_30003.png')),
    );
  }
}
