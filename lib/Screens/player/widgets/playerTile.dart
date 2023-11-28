import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:slashi_music/Screens/allsongs/allsongs.dart';
import 'package:slashi_music/Screens/favourite/favourite.dart';
import 'package:slashi_music/Screens/player/player.dart';
import 'package:slashi_music/Screens/player/playerfunctions.dart';
import 'package:slashi_music/Screens/player/widgets/player_controller.dart';
import 'package:slashi_music/Screens/player/slider/text&slider.dart';
import 'package:slashi_music/Screens/player/widgets/favbutton.dart';
import 'package:slashi_music/Screens/player/widgets/stack.dart';
import 'package:slashi_music/Screens/widgets/artwidget/player&optionArt.dart';

// ignore: must_be_immutable
class PlayerTile extends StatefulWidget {
  PlayerTile({
    super.key,
    required this.audioplayer,
    required this.musicModelist,
    required this.screenHeight,
    required this.screenWidth,
  });
  double screenHeight;
  double screenWidth;
  List musicModelist;
  AudioPlayer audioplayer;

  @override
  State<PlayerTile> createState() => _PlayerTileState();
}

class _PlayerTileState extends State<PlayerTile> {
  @override
  void dispose() {
    allfavourite.clear();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: widget.screenHeight,
            width: widget.screenWidth,
            color: Colors.black,
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            playbackPosition = positions;
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_rounded,
                            color: Colors.white,
                            size: 30,
                          )),
                    ),
                    const Row(
                      children: [
                        Image(
                            width: 35,
                            image: AssetImage('assets/images/music.png')),
                        Padding(
                          padding: EdgeInsets.only(left: 3),
                          child: Text(
                            'SLASHI',
                            style: TextStyle(
                                fontFamily: 'SLASHI',
                                fontSize: 35,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 61,
                    )
                  ],
                ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Padding(
                //       padding: const EdgeInsets.only(left: 15),
                //       child: IconButton(
                //           onPressed: () {
                //             Navigator.of(context).pop();
                //           },
                //           icon: const Icon(
                //             Icons.arrow_back_ios_rounded,
                //             color: Colors.white,
                //             size: 30,
                //           )),
                //     ),
                //   ],
                // ),
                SizedBox(
                  height: MediaQuery.of(context).size.height / 30,
                ),
                Stack(
                  children: [
                    const ArtWorkWidget(),
                    if (n == null)
                      Favbutton(musicModelist: widget.musicModelist)
                  ],
                ),
                TextandSlider(
                  audioPlayer: widget.audioplayer,
                  duration: durations,
                  position: positions,
                  musicModelist: widget.musicModelist,
                ),
                Playercontroller(
                    audioplayer: widget.audioplayer,
                    playing: isplaying,
                    musicModelist: widget.musicModelist),
              ],
            )),
        const Stackitem(),
      ],
    );
  }
}
