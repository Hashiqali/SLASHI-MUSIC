import 'package:flutter/material.dart';
import 'package:slashi_music/Screens/allsongs/allsongs.dart';
import 'package:slashi_music/Screens/widgets/artwidget/artwidget_options.dart';
import 'package:slashi_music/Screens/widgets/bottom_options/bottom_options.dart';
import 'package:slashi_music/Screens/player/player.dart';

// ignore: must_be_immutable
class ListTilewidget extends StatefulWidget {
  ListTilewidget(
      {super.key,
      required this.index,
      required this.value,
      required this.allsongs,
      this.i});

  var value;
  int? i;
  final int index;
  List allsongs;

  @override
  State<ListTilewidget> createState() => _ListTilewidgetState();
}

class _ListTilewidgetState extends State<ListTilewidget> {
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
          leading: Artlist(image: widget.value.image!),
          title: Text(
            widget.value.title,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(color: Colors.white),
          ),
          subtitle: Text(
            widget.value.artist,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(color: Colors.white),
          ),
          trailing: IconButton(
            onPressed: () {
              widget.i == null
                  ? bottomoptions(
                      widget.value.image!,
                      widget.value.title,
                      widget.value.artist,
                      widget.index,
                      allaudioPlayer,
                      widget.value.uri,
                      widget.allsongs,
                      context)
                  : bottomoptions(
                      widget.value.image!,
                      widget.value.title,
                      widget.value.artist,
                      widget.index,
                      allaudioPlayer,
                      widget.value.uri,
                      widget.allsongs,
                      context,
                      widget.value.id);
            },
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
          ),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
              return Player(
                musicModelist: widget.allsongs,
                audioplayer: allaudioPlayer,
                index: widget.index,
                i: widget.i,
              );
            }));
          },
        ),
      ),
    );
  }
}
