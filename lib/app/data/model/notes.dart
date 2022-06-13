class Note {
  String? title;
  String? endDate;
  String? status;
  int? id;

  Note({this.title, this.endDate, this.status, this.id});

  /// Map to Object
  Note.fromJson(Map<String, dynamic> json) {
    id = DateTime.now().microsecond;
    title = json['title'];
    endDate = json['endDate'];
    status = json['status'];
  }

  /// Object to Map
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'endDate': endDate,
        'status': status,
      };
}
