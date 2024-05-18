import 'package:flutter/material.dart';
import 'package:hutech_check_in_app/widgets/group_widget.dart';

class GroupsResponse {
  List<Group>? group;
  Model? model;

  GroupsResponse({this.group, this.model});

  GroupsResponse.fromJson(Map<String, dynamic> json) {
    if (json['group'] != null) {
      group = <Group>[];
      json['group'].forEach((v) {
        group!.add(Group.fromJson(v));
      });
    }
    model = json['model'] != null ? Model.fromJson(json['model']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (group != null) {
      data['group'] = group!.map((v) => v.toJson()).toList();
    }
    if (model != null) {
      data['model'] = model!.toJson();
    }
    return data;
  }
}

class Group {
  int? id;
  String? name;
  String? description;
  String? lecturer;
  String? schoolyear;
  String? semester;
  String? subject;
  int? type;
  int? status;
  late GlobalKey<GroupWidgetState> key;

  Group(
      {this.id,
      this.name,
      this.description,
      this.lecturer,
      this.schoolyear,
      this.semester,
      this.subject,
      this.type,
      this.status});

  Group.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    lecturer = json['lecturer'];
    schoolyear = json['schoolyear'];
    semester = json['semester'];
    subject = json['subject'];
    type = json['type'];
    status = json['status'];
    key = GlobalKey();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['lecturer'] = lecturer;
    data['schoolyear'] = schoolyear;
    data['semester'] = semester;
    data['subject'] = subject;
    data['type'] = type;
    data['status'] = status;
    return data;
  }
}

class Model {
  int? schoolyear;
  int? semester;
  int? status;

  Model({this.schoolyear, this.semester, this.status});

  Model.fromJson(Map<String, dynamic> json) {
    schoolyear = json['schoolyear'];
    semester = json['semester'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['schoolyear'] = schoolyear;
    data['semester'] = semester;
    data['status'] = status;
    return data;
  }
}
