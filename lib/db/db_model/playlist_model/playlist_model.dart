import 'package:hive_flutter/hive_flutter.dart';
part 'playlist_model.g.dart';

@HiveType(typeId: 2)
class Playlistmodel {
  @HiveField(0)
  final String? name;
  @HiveField(1)
  late List? songsList;
  @HiveField(2)
  late int? id;
  @HiveField(3)
  late String? title;
  @HiveField(4)
  late String? artist;
  @HiveField(5)
  late int? image;
  @HiveField(6)
  late String? uri;
  @HiveField(7)
  late int? idlist;

  Playlistmodel(
      {this.name,
      this.songsList,
      this.id,
      this.artist,
      this.image,
      this.title,
      this.idlist,
      this.uri});
}
