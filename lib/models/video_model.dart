class VideosModel {
  String title;
  String thumbnailUrl;
  String videoId;

  VideosModel({this.title, this.thumbnailUrl, this.videoId});

  VideosModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    thumbnailUrl = json['thumbnailUrl'];
    videoId = json['videoId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['thumbnailUrl'] = thumbnailUrl;
    data['videoId'] = videoId;
    return data;
  }
}
