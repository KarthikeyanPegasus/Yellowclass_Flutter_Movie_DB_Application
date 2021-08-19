// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Moviemodel.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MoviemodelAdapter extends TypeAdapter<Moviemodel> {
  @override
  final int typeId = 0;

  @override
  Moviemodel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Moviemodel(
      moviename: fields[0] as String,
      directorname: fields[1] as String,
      genre: fields[2] as String,
      link: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Moviemodel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.moviename)
      ..writeByte(1)
      ..write(obj.directorname)
      ..writeByte(2)
      ..write(obj.genre)
      ..writeByte(3)
      ..write(obj.link);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MoviemodelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
