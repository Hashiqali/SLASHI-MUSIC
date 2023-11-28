import 'dart:async';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:slashi_music/Screens/mostlyplayed/mostfunctions.dart';
import 'package:slashi_music/Screens/player/widgets/playerTile.dart';
import 'package:slashi_music/Screens/player/playerfunctions.dart';
import 'package:slashi_music/Screens/recent/recentfunctions.dart';
import 'package:slashi_music/db/db_model/music_model/db_model.dart';
import 'package:slashi_music/provider/song_model_provider.dart';

// ignore: must_be_immutable
class Player extends StatefulWidget {
  Player(
      {super.key,
      required this.musicModelist,
      required this.audioplayer,
      required this.index,
      this.i});
  final List musicModelist;
  int? i;
  final AudioPlayer audioplayer;
  final int index;

  @override
  State<Player> createState() => _ManiscreenState();
}

int? n;
bool favdele = false;
int currentIndex = 0;
bool isshuffle = false;
bool isadded = false;
int? idfav;
bool isplaying = false;
Duration durations = const Duration();
Duration positions = const Duration();
Duration playbackPosition = Duration.zero;

Map<String, Duration> playbackPositions = {};

class _ManiscreenState extends State<Player> {
  List<AudioSource> songlist = [];

  late StreamSubscription<Duration?> _durationSubscription;
  late StreamSubscription<Duration?> _positionSubscription;
  late StreamSubscription<PlayerState> _playerStateSubscription;

  @override
  void initState() {
    n = widget.i;
    currentIndex = widget.index;
    getfavcontains(widget.musicModelist[currentIndex]);

    checkmount();
    playSong(widget.index);
    listenToEvent();
    listenTosongIndex();
    super.initState();
  }

  @override
  void dispose() {
    getallrecentFromHive();
    songlist.clear();
    _durationSubscription.cancel();
    _positionSubscription.cancel();
    _playerStateSubscription.cancel();
    widget.audioplayer.setShuffleModeEnabled(false);

    final currentUri = widget.musicModelist[currentIndex].uri;
    playbackPositions[currentUri] = positions;
    savePlaybackPosition(currentUri, positions);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenHeight,
              child: PlayerTile(
                  audioplayer: widget.audioplayer,
                  musicModelist: widget.musicModelist,
                  screenHeight: screenHeight,
                  screenWidth: screenWidth),
            ),
          ],
        ),
      ),
    );
  }

  void playSong(int index) async {
    if (!mounted) {
      return;
    }
    try {
      songlist.clear();
      for (var element in widget.musicModelist) {
        songlist.add(
          AudioSource.uri(
            Uri.parse(element.uri!),
          ),
        );
      }

      if (isshuffle) {
        songlist.shuffle();
        currentIndex = index;
      }
      bool isCurrentlyPlayingSong =
          widget.audioplayer.currentIndex == widget.index &&
              widget.audioplayer.playing;

      Duration initialPosition =
          isCurrentlyPlayingSong ? widget.audioplayer.position : Duration.zero;

      widget.audioplayer.setAudioSource(
        initialIndex: index,
        initialPosition: initialPosition,
        ConcatenatingAudioSource(children: songlist),
      );
      widget.audioplayer.play();

      isplaying = true;

      widget.audioplayer.durationStream.listen((duration) {
        if (mounted) {
          if (duration != null) {
            setState(() {
              durations = duration;
            });
          }
        }
      });

      widget.audioplayer.positionStream.listen((position) {
        if (mounted) {
          setState(() {
            positions = position;
          });
        }
      });
    } on Exception catch (_) {
      if (mounted) {
        Navigator.of(context).pop();
      }
    }
  }

  void listenToEvent() {
    _playerStateSubscription =
        widget.audioplayer.playerStateStream.listen((state) {
      if (mounted) {
        if (state.playing) {
          setState(() {
            isplaying = true;
          });
        } else {
          setState(() {
            isplaying = false;
          });
        }
        if (state.processingState == ProcessingState.completed) {
          setState(() {
            isplaying = false;
          });
        }
      }
    });
    widget.audioplayer.playerStateStream.listen((state) {
      if (mounted) {
        if (state.playing) {
          setState(() {
            isplaying = true;
          });
        } else {
          setState(() {
            isplaying = false;
          });
        }
        if (state.processingState == ProcessingState.completed) {
          setState(() {
            isplaying = false;
            Navigator.of(context).pop();
          });
        }
      }
    });
  }

  listenTosongIndex() {
    widget.audioplayer.currentIndexStream.listen((event) {
      if (mounted) {
        if (event != null &&
            event >= 0 &&
            event < widget.musicModelist.length) {
          setState(() {
            currentIndex = event;
            context
                .read<Songmodelprovider>()
                .setid(widget.musicModelist[currentIndex].image!);
            var val = Musicmodel(
              title: widget.musicModelist[currentIndex].title,
              artist: widget.musicModelist[currentIndex].artist,
              image: widget.musicModelist[currentIndex].image,
              uri: widget.musicModelist[currentIndex].uri,
            );
            getfavcontains(widget.musicModelist[currentIndex]);
            mostfunctions(val);
            recentfunction(val);
          });
        }
      }
    });
  }

  checkmount() {
    if (mounted) {
      _durationSubscription =
          widget.audioplayer.durationStream.listen((duration) {
        if (duration != null) {
          setState(() {
            durations = duration;
          });
        }
      });
      _positionSubscription =
          widget.audioplayer.positionStream.listen((position) {
        setState(() {
          positions = position;
        });
      });
    }
  }
}
