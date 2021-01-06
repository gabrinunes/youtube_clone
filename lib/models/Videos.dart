import 'package:youtube/models/Video_detail.dart';
import 'package:youtube/models/Video_id.dart';

import 'package:json_annotation/json_annotation.dart';

part 'Videos.g.dart';

@JsonSerializable(explicitToJson: true)
class Videos {
  Video_id id;
  Video_detail snippet;

  Videos(this.id, this.snippet);

  factory Videos.fromJson(Map<String, dynamic> json) => _$VideosFromJson(json);

  Map<String, dynamic> toJson() => _$VideosToJson(this);
}
