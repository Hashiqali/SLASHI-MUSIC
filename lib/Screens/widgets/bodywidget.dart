import 'package:flutter/material.dart';
import 'package:slashi_music/Screens/allsongs/allsongs.dart';
import 'package:slashi_music/Screens/player/player.dart';
import 'package:slashi_music/Screens/widgets/snackbar.dart';

// must_be_immutable
// ignore: must_be_immutable
class Body1 extends StatefulWidget {
  Body1(
      {super.key,
      required this.music,
      required this.text,
      required this.widget,
      this.i});
  int? i;
  List music;
  String text;
  StatefulWidget widget;
  @override
  State<Body1> createState() => _Body1State();
}

// ignore: camel_case_types
class _Body1State extends State<Body1> {
  @override
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 0, 0, 0),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.text,
                  style: const TextStyle(
                    fontFamily: 'SLASHI',
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        widget.music.isEmpty
                            ? snackbar('No songs', context)
                            : Navigator.of(context)
                                .push(MaterialPageRoute(builder: (ctx) {
                                return Player(
                                  musicModelist: widget.music.reversed.toList(),
                                  audioplayer: allaudioPlayer,
                                  index:
                                      widget.music.indexOf(widget.music.first),
                                );
                              }));
                      },
                      child: const Image(
                        width: 40,
                        image: AssetImage('assets/images/play-circle.png'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(child: widget.widget),
        ],
      ),
    );
  }
}
