class ProblemsResponse {
  List<Problems>? problems;

  ProblemsResponse({this.problems});

  ProblemsResponse.fromJson(Map<String, dynamic> json) {
    if (json['problems'] != null) {
      problems = <Problems>[];
      json['problems'].forEach((v) {
        problems!.add(Problems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (problems != null) {
      data['problems'] = problems!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Problems {
  int? id;
  String? title;
  int? solved;
  int? submit;
  String? description;

  Problems({this.id, this.title, this.solved, this.submit, this.description});

  Problems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    solved = json['solved'];
    submit = json['submit'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['solved'] = solved;
    data['submit'] = submit;
    data['description'] = description;
    return data;
  }
}
