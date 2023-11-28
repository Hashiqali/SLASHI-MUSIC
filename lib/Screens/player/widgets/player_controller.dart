import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:slashi_music/Screens/player/player.dart';
import 'package:slashi_music/Screens/widgets/showplaylist.dart';
import 'package:slashi_music/Screens/widgets/snackbar.dart';
import 'package:slashi_music/db/db_model/playlist_model/playlist_model.dart';

// ignore: must_be_immutable
class Playercontroller extends StatefulWidget {
  Playercontroller(
      {super.key,
      required this.audioplayer,
      required this.playing,
      required this.musicModelist});
  AudioPlayer audioplayer;
  bool playing;
  List musicModelist;
  @override
  State<Playercontroller> createState() => _PlayercontrollerState();
}

class _PlayercontrollerState extends State<Playercontroller> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isshuffle = !isshuffle;
                if (isshuffle) {
                  widget.audioplayer.setShuffleModeEnabled(true);
                  snackbar('Shuffled', context);
                } else {
                  widget.audioplayer.setShuffleModeEnabled(false);
                }
              });
            },
            child: isshuffle == false
                ? Icon(
                    Icons.shuffle,
                    size: 30,
                    color: Colors.orange.shade700,
                  )
                : Icon(
                    Icons.shuffle_on_sharp,
                    size: 30,
                    color: Colors.orange.shade700,
                  ),
          ),
          InkWell(
              onTap: () {
                if (widget.audioplayer.hasPrevious) {
                  widget.audioplayer.seekToPrevious();
                }
              },
              child: const Icon(
                Icons.navigate_before_rounded,
                color: Colors.white,
                size: 50,
              )),
          InkWell(
            onTap: () {
              setState(() {
                if (widget.playing) {
                  widget.audioplayer.pause();
                } else {
                  widget.audioplayer.play();
                }
                widget.playing = !widget.playing;
              });
            },
            child: widget.playing
                ? Icon(
                    Icons.pause_circle_filled_rounded,
                    color: Colors.orange.shade700,
                    size: 82,
                  )
                : Icon(
                    Icons.play_circle_filled_rounded,
                    color: Colors.orange.shade700,
                    size: 82,
                  ),
          ),
          InkWell(
              onTap: () {
                if (widget.audioplayer.hasNext) {
                  widget.audioplayer.seekToNext();
                }
              },
              child: const Icon(
                Icons.navigate_next_rounded,
                color: Colors.white,
                size: 50,
              )),
          InkWell(
              onTap: () {
                final value = Playlistmodel(
                    artist: widget.musicModelist[currentIndex].artist,
                    title: widget.musicModelist[currentIndex].title,
                    image: widget.musicModelist[currentIndex].image,
                    uri: widget.musicModelist[currentIndex].uri);

                showplaylistinbottomsheet(value, context);
              },
              child: Icon(
                Icons.library_music,
                size: 35,
                color: Colors.orange.shade700,
              )),
        ],
      ),
    );
  }
}
