import 'package:youtube/models/Video_detail.dart';
import 'package:youtube/models/Video_id.dart';

import 'package:json_annotation/json_annotation.dart';

part 'Videos.g.dart';

@JsonSerializable(explicitToJson: true)
class Videos {
  Video_id id;
  Video_detail detail;

  Videos(this.id, this.detail);

  factory Videos.fromJson(Map<String, dynamic> json) => _$VideosFromJson(json);

  Map<String, dynamic> toJson() => _$VideosToJson(this);
}
