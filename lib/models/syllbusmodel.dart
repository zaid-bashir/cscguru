class SyllbusModel {
  String courseName;
  String courseCode;
  String stageType;
  String duration;
  String subjectCode;
  String subjectName;
  String credits;
  String batch;
  String fileUrl;
  String subjectImage;

  SyllbusModel(
      {this.courseName,
      this.courseCode,
      this.stageType,
      this.duration,
      this.subjectCode,
      this.subjectName,
      this.credits,
      this.batch,
      this.fileUrl,
      this.subjectImage,
      });

  SyllbusModel.fromJson(Map<String, dynamic> json) {
    courseName = json['courseName'];
    courseCode = json['courseCode'];
    stageType = json['stageType'];
    duration = json['duration'];
    subjectCode = json['subjectCode'];
    subjectName = json['subjectName'];
    credits = json['credits'];
    batch = json['batch'];
    fileUrl = json['fileUrl'];
    subjectImage = json['subjectImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['courseName'] = courseName;
    data['courseCode'] = courseCode;
    data['stageType'] = stageType;
    data['duration'] = duration;
    data['subjectCode'] = subjectCode;
    data['subjectName'] = subjectName;
    data['credits'] = credits;
    data['batch'] = batch;
    data['fileUrl'] = fileUrl;
    data['subjectImage'] = subjectImage;
    return data;
  }
}
