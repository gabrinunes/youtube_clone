import 'package:json_annotation/json_annotation.dart';

part 'Video_id.g.dart';

@JsonSerializable()
class Video_id {
  String videoId;

  Video_id(this.videoId);

  factory Video_id.fromJson(Map<String, dynamic> json) =>
      _$Video_idFromJson(json);

  Map<String, dynamic> toJson() => _$Video_idToJson(this);
}
