class CheckInResultResponse {
  List<CheckInResult>? checkInResult;

  CheckInResultResponse({this.checkInResult});

  CheckInResultResponse.fromJson(Map<String, dynamic> json) {
    if (json['check_in_result'] != null) {
      checkInResult = <CheckInResult>[];
      json['check_in_result'].forEach((v) {
        checkInResult!.add(CheckInResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (checkInResult != null) {
      data['check_in_result'] = checkInResult!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CheckInResult {
  int? id;
  int? checkindetailId;
  int? userId;
  int? status;
  int? manualCheckinBy;
  String? createdAt;
  int? deviceId;

  CheckInResult(
      {this.id,
      this.checkindetailId,
      this.userId,
      this.status,
      this.manualCheckinBy,
      this.createdAt,
      this.deviceId});

  CheckInResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    checkindetailId = json['checkindetail_id'];
    userId = json['user_id'];
    status = json['status'];
    manualCheckinBy = json['manual_checkin_by'];
    createdAt = json['created_at'];
    deviceId = json['device_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['checkindetail_id'] = checkindetailId;
    data['user_id'] = userId;
    data['status'] = status;
    data['manual_checkin_by'] = manualCheckinBy;
    data['created_at'] = createdAt;
    data['device_id'] = deviceId;
    return data;
  }
}
