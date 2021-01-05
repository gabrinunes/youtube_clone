import 'package:json_annotation/json_annotation.dart';

part 'Video_detail.g.dart';

@JsonSerializable()
class Video_detail {
  String title;
  String description;

  Video_detail(this.title, this.description);

  factory Video_detail.fromJson(Map<String, dynamic> json) =>
      _$Video_detailFromJson(json);

  Map<String, dynamic> toJson() => _$Video_detailToJson(this);
}
