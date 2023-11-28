import 'package:flutter/material.dart';
import 'package:slashi_music/Screens/allsongs/allsongs.dart';
import 'package:slashi_music/Screens/favourite/favourite.dart';
import 'package:slashi_music/Screens/playlist/playlist.dart';
import 'package:slashi_music/Screens/recent/recent.dart';
import 'package:slashi_music/Screens/search/search.dart';

// ignore: must_be_immutable
class Tabbar extends StatelessWidget {
  Tabbar({super.key, required this.key1});
  // ignore: prefer_typing_uninitialized_variables
  var key1;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: Column(
          children: [
            const SizedBox(
              height: 65,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      key1.currentState!.openDrawer();
                    },
                    icon: const Icon(
                      Icons.menu_rounded,
                      color: Colors.white,
                      size: 30,
                    ),
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
                  IconButton(
                      onPressed: () {
                        showSearch(
                          context: context,
                          delegate: CustomSearchDelegate(),
                        );
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                        size: 35,
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const TabBar(
              dividerColor: Colors.black,
              labelColor: Colors.white,
              labelStyle: TextStyle(fontFamily: 'SLASHI', fontSize: 18),
              tabAlignment: TabAlignment.center,
              indicator: BoxDecoration(
                  border: Border(
                      bottom: BorderSide(
                          width: 4, color: Color.fromARGB(255, 255, 111, 0)))),
              tabs: [
                Tab(
                  text: 'Songs',
                ),
                Tab(
                  text: 'Recent',
                ),
                Tab(
                  text: 'Favourite',
                ),
                Tab(
                  text: 'Playlist',
                ),
              ],
            ),
            const Flexible(
                child: TabBarView(children: [
              SongsList(),
              Recent(),
              Favourite(),
              Playlist(),
            ])),
          ],
        ),
      ),
    );
  }
}
