class NoteModel {
  String noteName;
  String type;
  String noteUrl;

  NoteModel({this.noteName, this.type, this.noteUrl});

  NoteModel.fromJson(Map<String, dynamic> json) {
    noteName = json['noteName'];
    type = json['type'];
    noteUrl = json['noteUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['noteName'] = noteName;
    data['type'] = type;
    data['noteUrl'] = noteUrl;
    return data;
  }
}
