import 'package:flutter/material.dart';
import 'package:slashi_music/Screens/allsongs/allsongs.dart';
import 'package:slashi_music/Screens/player/player.dart';
import 'package:slashi_music/Screens/playlist/functions&others/playlist_functions.dart';
import 'package:slashi_music/Screens/widgets/artwidget/artwidget_options.dart';
import 'package:slashi_music/Screens/widgets/snackbar.dart';

// ignore: must_be_immutable
class Songstile extends StatefulWidget {
  Songstile({super.key, required this.all, required this.name});
  List all;
  String name;
  @override
  State<Songstile> createState() => _SongstileState();
}

class _SongstileState extends State<Songstile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.all = widget.all.reversed.toList();
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ListView.separated(
        itemBuilder: (ctx, index) {
          final data = widget.all[index];
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
                leading: Artlist(image: data.image!),
                title: Text(
                  data.title!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(color: Colors.white),
                ),
                subtitle: Text(
                  data.artist!,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: const TextStyle(color: Colors.white),
                ),
                trailing: IconButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (ctx) {
                          return AlertDialog(
                            backgroundColor: Colors.black,
                            content: Text(
                              'Remove the song ?',
                              style: TextStyle(
                                  color: Colors.orange.shade700,
                                  fontFamily: 'SLASHI'),
                            ),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    setState(() {
                                      deleteplaylistsongs(
                                          widget.all,
                                          data.idlist,
                                          index,
                                          widget.name,
                                          data.id);
                                    });
                                    snackbar(
                                        'Removed from ${widget.name}', context);
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'Yes',
                                    style: TextStyle(
                                        color: Colors.orange.shade700,
                                        fontFamily: 'SLASHI'),
                                  )),
                              TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'No',
                                    style: TextStyle(
                                        color: Colors.orange.shade700,
                                        fontFamily: 'SLASHI'),
                                  ))
                            ],
                          );
                        });
                  },
                  icon: Icon(
                    Icons.delete_rounded,
                    color: Colors.orange.shade700,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
                    return Player(
                        musicModelist: widget.all,
                        audioplayer: allaudioPlayer,
                        index: index);
                  }));
                },
              ),
            ),
          );
        },
        separatorBuilder: (ctx, index) {
          return const SizedBox(
            height: 7,
          );
        },
        itemCount: widget.all.length,
      ),
    );
  }
}
