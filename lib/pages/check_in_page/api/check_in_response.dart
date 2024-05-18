class CheckInResponse {
  List<CheckIn>? checkIn;

  CheckInResponse({this.checkIn});

  CheckInResponse.fromJson(Map<String, dynamic> json) {
    if (json['check_in'] != null) {
      checkIn = <CheckIn>[];
      json['check_in'].forEach((v) {
        checkIn!.add(CheckIn.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (checkIn != null) {
      data['check_in'] = checkIn!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CheckIn {
  int? id;
  int? groupId;
  String? title;
  int? times;
  int? createdBy;
  String? createdAt;
  String? specificDay;

  CheckIn(
      {this.id,
      this.groupId,
      this.title,
      this.times,
      this.createdBy,
      this.createdAt,
      this.specificDay});

  CheckIn.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupId = json['group_id'];
    title = json['title'];
    times = json['times'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    specificDay = json['specific_day'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['group_id'] = groupId;
    data['title'] = title;
    data['times'] = times;
    data['created_by'] = createdBy;
    data['created_at'] = createdAt;
    data['specific_day'] = specificDay;
    return data;
  }
}
