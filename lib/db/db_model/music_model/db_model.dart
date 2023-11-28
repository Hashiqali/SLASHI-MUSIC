import 'package:hive_flutter/adapters.dart';
part 'db_model.g.dart';

@HiveType(typeId: 1)
class Musicmodel {
  @HiveField(0)
  late String title;
  @HiveField(1)
  late String artist;
  @HiveField(2)
  int? id;
  @HiveField(3)
  int? image;
  @HiveField(4)
  String? uri;

  Musicmodel(
      {required this.title,
      required this.artist,
      required this.image,
      required this.uri,
      this.id});
}
