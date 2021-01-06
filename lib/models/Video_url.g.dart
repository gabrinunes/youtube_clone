// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Video_url.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Video_url _$Video_urlFromJson(Map<String, dynamic> json) {
  return Video_url(
    json['high'] == null
        ? null
        : Video_high.fromJson(json['high'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$Video_urlToJson(Video_url instance) => <String, dynamic>{
      'high': instance.high,
    };
