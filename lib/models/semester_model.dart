// ignore_for_file: unnecessary_new, prefer_collection_literals

class SemesterModel {
  String semesterName;
  String courseName;
  String imageUrl;

  SemesterModel({this.semesterName, this.courseName, this.imageUrl});

  SemesterModel.fromJson(Map<String, dynamic> json) {
    semesterName = json['semesterName'];
    courseName = json['courseName'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['semesterName'] = semesterName;
    data['courseName'] = courseName;
    data['imageUrl'] = imageUrl;
    return data;
  }
}
