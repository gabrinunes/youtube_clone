import 'package:json_annotation/json_annotation.dart';
import 'package:youtube/models/Video_url.dart';

part 'Video_detail.g.dart';

@JsonSerializable()
class Video_detail {
  String title;
  String description;
  String channelTitle;
  Video_url thumbnails;

  Video_detail(
      this.title, this.description, this.thumbnails, this.channelTitle);

  factory Video_detail.fromJson(Map<String, dynamic> json) =>
      _$Video_detailFromJson(json);

  Map<String, dynamic> toJson() => _$Video_detailToJson(this);
}
