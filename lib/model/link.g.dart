// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'link.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LinkAdapter extends TypeAdapter<Link> {
  @override
  final int typeId = 0;

  @override
  Link read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Link(
      facebook: fields[0] as String,
      instagram: fields[1] as String,
      tiktok: fields[2] as String,
      customLink: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Link obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.facebook)
      ..writeByte(1)
      ..write(obj.instagram)
      ..writeByte(2)
      ..write(obj.tiktok)
      ..writeByte(3)
      ..write(obj.customLink);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LinkAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
