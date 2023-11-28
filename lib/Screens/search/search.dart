import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:lottie/lottie.dart';
import 'package:slashi_music/Screens/search/search_tile.dart';
import 'package:slashi_music/db/db_model/music_model/db_model.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      textTheme: Typography.whiteCupertino,
      scaffoldBackgroundColor: Colors.black,
      inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(
        color: Colors.white,
      )),
      hintColor: Colors.white,
      canvasColor: Colors.black,
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black,
        toolbarTextStyle: TextStyle(color: Colors.white),
      ),
    );
  }

  List data = [];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(
            Icons.clear,
            color: Colors.white,
          ))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, '');
        },
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white,
        ));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    String queryLowerCase = query.toLowerCase();
    return FutureBuilder<Box<Musicmodel>>(
      future: Hive.openBox<Musicmodel>('songs'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final songbox = snapshot.data!.values.toList();
          final filtered = songbox
              .where((element) =>
                  element.title.toLowerCase().contains(query.toLowerCase()))
              .toList();

          if (query.isEmpty) {
            return Center(
                child: Lottie.asset(
                    height: 120,
                    'assets/animation/searching song animation.json'));
          } else if (filtered.isEmpty) {
            return Center(
              child: Lottie.asset(
                  height: 120,
                  'assets/animation/no searched song animation.json'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
                child: Text(
              'No songs available',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ));
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView.separated(
              itemBuilder: (ctx, index) {
                final song = filtered[index];
                String nameval = song.title.toLowerCase();
                if ((nameval).contains(queryLowerCase.trim())) {
                  return SearchTile(
                      song: song, filtered: filtered, index: index);
                } else {
                  return Container();
                }
              },
              separatorBuilder: (ctx, index) {
                return const SizedBox(
                  height: 7,
                );
              },
              itemCount: filtered.length,
            );
          }
        } else {
          return Container();
        }
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    String queryLowerCase = query.toLowerCase();
    return FutureBuilder<Box<Musicmodel>>(
      future: Hive.openBox<Musicmodel>('songs'),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final songbox = snapshot.data!.values.toList();
          final filtered = songbox
              .where((element) =>
                  element.title.toLowerCase().contains(query.toLowerCase()))
              .toList();

          if (query.isEmpty) {
            return Center(
                child: Lottie.asset(
                    height: 120,
                    'assets/animation/searching song animation.json'));
          } else if (filtered.isEmpty) {
            return Center(
              child: Lottie.asset(
                  height: 120,
                  'assets/animation/no searched song animation.json'),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
                child: Text(
              'No songs available.',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ));
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          } else {
            return ListView.separated(
              itemBuilder: (ctx, index) {
                final song = filtered[index];
                String nameval = song.title.toLowerCase();

                if ((nameval).contains((queryLowerCase.trim()))) {
                  return SearchTile(
                      song: song, filtered: filtered, index: index);
                } else {}
                return null;
              },
              separatorBuilder: (ctx, index) {
                return const SizedBox(
                  height: 7,
                );
              },
              itemCount: filtered.length,
            );
          }
        } else {
          return Container();
        }
      },
    );
  }
}
