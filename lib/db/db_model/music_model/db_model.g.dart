// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MusicmodelAdapter extends TypeAdapter<Musicmodel> {
  @override
  final int typeId = 1;

  @override
  Musicmodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Musicmodel(
      title: fields[0] as String,
      artist: fields[1] as String,
      image: fields[3] as int?,
      uri: fields[4] as String?,
      id: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, Musicmodel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.artist)
      ..writeByte(2)
      ..write(obj.id)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.uri);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MusicmodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
