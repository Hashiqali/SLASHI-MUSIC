import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:slashi_music/Screens/playlist/functions&others/playlist_options.dart';
import 'package:slashi_music/Screens/playlist/playlistsongs/playlistsongs.dart';

class Gridtile extends StatelessWidget {
  const Gridtile({super.key, required this.data, required this.img});
  final data;
  final img;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) {
          return Playlistsongs(
            songid: data.songsList!,
            name: data.name,
          );
        }));
      },
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 26, 26, 25),
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, left: 5),
                  child: SizedBox(
                      width: 80,
                      height: 20,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Text(
                          data.name ?? 'hello',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: const TextStyle(
                              color: Colors.white, fontFamily: 'SLASHI'),
                        ),
                      )),
                ),
                SizedBox(
                  width: 43,
                  height: 35,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: IconButton(
                      onPressed: () {
                        playlistBottomoptions(data.id, data.name,
                            data.songsList.reversed.toList(), context);
                      },
                      icon: const Icon(
                        Icons.more_horiz,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            if (img.isEmpty)
              const Padding(
                padding: EdgeInsets.only(top: 40),
                child: Text(
                  'No Songs!!',
                  style: TextStyle(color: Colors.white, fontFamily: 'SLASHI'),
                ),
              ),
            Expanded(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  crossAxisSpacing: 0,
                  mainAxisSpacing: 7,
                ),
                itemCount: img.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8),
                    child: QueryArtworkWidget(
                      id: img[index].image ?? 1,
                      type: ArtworkType.AUDIO,
                      artworkHeight: 20,
                      artworkWidth: 60,
                      artworkFit: BoxFit.fill,
                      artworkQuality: FilterQuality.high,
                      artworkBorder: BorderRadius.circular(15),
                      quality: 100,
                      nullArtworkWidget: Container(
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 53, 52, 52),
                            borderRadius: BorderRadius.circular(10)),
                        child: const Image(
                            height: 50,
                            width: 60,
                            image: AssetImage(
                                'assets/images/Play_Music_30003.png')),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
