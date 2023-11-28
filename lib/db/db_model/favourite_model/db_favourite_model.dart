import 'package:hive_flutter/hive_flutter.dart';
part 'db_favourite_model.g.dart';

@HiveType(typeId: 0)
class Favourmodel {
  @HiveField(0)
  late String title;
  @HiveField(1)
  late String artist;
  @HiveField(2)
  int? id;
  @HiveField(3)
  late int? image;
  @HiveField(4)
  late String? uri;

  Favourmodel(
      {required this.title,
      required this.artist,
      required this.image,
      required this.uri,
      this.id});
}
