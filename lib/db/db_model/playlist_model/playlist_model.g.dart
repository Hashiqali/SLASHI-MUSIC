// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playlist_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PlaylistmodelAdapter extends TypeAdapter<Playlistmodel> {
  @override
  final int typeId = 2;

  @override
  Playlistmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Playlistmodel(
      name: fields[0] as String?,
      songsList: (fields[1] as List?)?.cast<dynamic>(),
      id: fields[2] as int?,
      artist: fields[4] as String?,
      image: fields[5] as int?,
      title: fields[3] as String?,
      idlist: fields[7] as int?,
      uri: fields[6] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Playlistmodel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.songsList)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.artist)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.uri)
      ..writeByte(7)
      ..write(obj.idlist);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlaylistmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
