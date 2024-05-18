class AssignmentSeriesResponse {
  List<AssignmentSeries>? assignmentSeries;

  AssignmentSeriesResponse({this.assignmentSeries});

  AssignmentSeriesResponse.fromJson(Map<String, dynamic> json) {
    if (json['assignmentSeries'] != null) {
      assignmentSeries = <AssignmentSeries>[];
      json['assignmentSeries'].forEach((v) {
        assignmentSeries!.add(AssignmentSeries.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (assignmentSeries != null) {
      data['assignmentSeries'] =
          assignmentSeries!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AssignmentSeries {
  int? id;
  String? title;
  String? startTime;
  String? endTime;
  int? totalUsers;
  int? status;

  AssignmentSeries(
      {this.id,
      this.title,
      this.startTime,
      this.endTime,
      this.totalUsers,
      this.status});

  AssignmentSeries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    totalUsers = json['total_users'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['total_users'] = totalUsers;
    data['status'] = status;
    return data;
  }
}
