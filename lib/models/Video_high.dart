import 'package:json_annotation/json_annotation.dart';

part 'Video_high.g.dart';

@JsonSerializable()
class Video_high {
  String url;
  int width;
  int height;

  Video_high(this.url, this.width, this.height);

  factory Video_high.fromJson(Map<String, dynamic> json) =>
      _$Video_highFromJson(json);

  Map<String, dynamic> toJson() => _$Video_highToJson(this);
}
