// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Video_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Video_detail _$Video_detailFromJson(Map<String, dynamic> json) {
  return Video_detail(
    json['title'] as String,
    json['description'] as String,
    json['thumbnails'] == null
        ? null
        : Video_url.fromJson(json['thumbnails'] as Map<String, dynamic>),
    json['channelTitle'] as String,
  );
}

Map<String, dynamic> _$Video_detailToJson(Video_detail instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'channelTitle': instance.channelTitle,
      'thumbnails': instance.thumbnails,
    };
