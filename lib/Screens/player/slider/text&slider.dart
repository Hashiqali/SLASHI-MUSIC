import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:slashi_music/Screens/player/player.dart';
import 'package:slashi_music/Screens/player/playerfunctions.dart';

// ignore: must_be_immutable
class TextandSlider extends StatefulWidget {
  TextandSlider(
      {super.key,
      required this.audioPlayer,
      required this.duration,
      required this.position,
      required this.musicModelist});
  AudioPlayer audioPlayer;
  var duration;
  var position;
  List musicModelist;
  @override
  State<TextandSlider> createState() => _TextandSlider();
}

int index = 0;

class _TextandSlider extends State<TextandSlider> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 7,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40, right: 40),
          child: Text(
            widget.musicModelist[currentIndex].title,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(
                fontFamily: 'SLASHI', fontSize: 30, color: Colors.white),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 60, right: 60),
          child: Text(
            widget.musicModelist[currentIndex].artist,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(
                fontFamily: 'SLASHI', fontSize: 20, color: Colors.white),
          ),
        ),
        const SizedBox(
          height: 3,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 13, right: 13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Slider(
                  activeColor: const Color.fromARGB(255, 255, 111, 0),
                  inactiveColor: const Color.fromARGB(255, 255, 255, 255),
                  min: 0.0,
                  value: widget.position.inSeconds
                      .toDouble()
                      .clamp(0.0, widget.duration.inSeconds.toDouble()),
                  max: widget.duration.inSeconds.toDouble(),
                  onChanged: (value) {
                    setState(() {
                      changeseconds(value.toInt(), widget.audioPlayer);
                    });
                  },
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 35, left: 35),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.position.toString().split('.')[0],
                style: const TextStyle(
                    color: Colors.white, fontFamily: 'SLASHI', fontSize: 17),
              ),
              Text(
                widget.duration.toString().split('.')[0],
                style: const TextStyle(
                    color: Colors.white, fontFamily: 'SLASHI', fontSize: 17),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 2,
        ),
      ],
    );
  }
}
