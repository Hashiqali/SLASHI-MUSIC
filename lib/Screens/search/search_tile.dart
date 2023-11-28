import 'package:flutter/material.dart';
import 'package:slashi_music/Screens/allsongs/allsongs.dart';
import 'package:slashi_music/Screens/player/player.dart';
import 'package:slashi_music/Screens/widgets/artwidget/artwidget_options.dart';
import 'package:slashi_music/db/db_model/music_model/db_model.dart';

final FocusNode focusNode = FocusNode();

// ignore: must_be_immutable
class SearchTile extends StatelessWidget {
  SearchTile(
      {super.key,
      required this.song,
      required this.filtered,
      required this.index});
  Musicmodel song;
  List filtered;
  int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(40, 255, 255, 255),
          borderRadius: BorderRadius.circular(10),
        ),
        width: double.infinity,
        height: 80,
        child: ListTile(
          leading: Artlist(image: song.image!),
          title: Text(
            song.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            song.artist,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(color: Colors.white),
          ),
          onTap: () {
            focusNode.unfocus();
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (ctx) => Player(
                musicModelist: filtered,
                audioplayer: allaudioPlayer,
                index: index,
              ),
            ));
          },
        ),
      ),
    );
  }
}
