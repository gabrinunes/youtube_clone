import 'package:json_annotation/json_annotation.dart';
import 'package:youtube/models/Video_high.dart';

part 'Video_url.g.dart';

@JsonSerializable()
class Video_url {
  Video_high high;

  Video_url(this.high);

  factory Video_url.fromJson(Map<String, dynamic> json) =>
      _$Video_urlFromJson(json);

  Map<String, dynamic> toJson() => _$Video_urlToJson(this);
}
