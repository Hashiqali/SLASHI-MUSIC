import 'package:flutter/material.dart';
import 'package:slashi_music/Screens/allsongs/allsongs.dart';
import 'package:slashi_music/Screens/mostlyplayed/bottom_options/options.dart';
import 'package:slashi_music/Screens/mostlyplayed/mostfunctions.dart';
import 'package:slashi_music/Screens/mostlyplayed/mostlyplayed.dart';
import 'package:slashi_music/Screens/player/player.dart';
import 'package:slashi_music/Screens/widgets/artwidget/artwidget_options.dart';
import 'package:slashi_music/db/db_model/music_model/db_model.dart';

// ignore: must_be_immutable
class MostTile extends StatelessWidget {
  MostTile({
    super.key,
    required this.index,
    required this.most,
  });
  int index;
  final Musicmodel most;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Artlist(image: most.image!),
      title: Text(
        most.title,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        most.artist,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        style: const TextStyle(color: Colors.white),
      ),
      trailing: IconButton(
        onPressed: () {
          mostoptions(most.image!, most.title, most.artist, index,
              allaudioPlayer, most.uri, index, context);
        },
        icon: const Icon(
          Icons.more_vert,
          color: Colors.white,
        ),
      ),
      onTap: () {
        getSongListFromHive();
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return Player(
            musicModelist: mostupdate,
            audioplayer: allaudioPlayer,
            index: index,
          );
        }));
      },
    );
  }
}
