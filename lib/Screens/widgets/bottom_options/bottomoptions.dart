import 'package:flutter/material.dart';
import 'package:slashi_music/Screens/widgets/artwidget/player&optionArt.dart';

// ignore: must_be_immutable
class Options extends StatelessWidget {
  Options(
      {super.key, required this.artist, required this.id, required this.title});
  int id;
  String artist;
  String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            Artoption(id: id),
            const SizedBox(
              width: 25,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 40),
                    child: Text(
                      title,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'SLASHI',
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Text(
                    artist,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: const TextStyle(
                      color: Colors.white,
                      fontFamily: 'SLASHI',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10, right: 10),
          child: Divider(
            color: Color.fromARGB(68, 255, 255, 255),
            thickness: 2,
          ),
        ),
      ],
    );
  }
}
