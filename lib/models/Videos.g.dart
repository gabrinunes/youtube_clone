// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Videos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Videos _$VideosFromJson(Map<String, dynamic> json) {
  return Videos(
    json['id'] == null
        ? null
        : Video_id.fromJson(json['id'] as Map<String, dynamic>),
    json['snippet'] == null
        ? null
        : Video_detail.fromJson(json['snippet'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$VideosToJson(Videos instance) => <String, dynamic>{
      'id': instance.id?.toJson(),
      'snippet': instance.snippet?.toJson(),
    };
