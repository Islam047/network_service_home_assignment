import 'dart:convert';

class DeleteEmployee {
  DeleteEmployee({
    this.status,
    this.data,
    this.message,});

  DeleteEmployee.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'];
    message = json['message'];
  }
  String? status;
  String? data;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['data'] = data;
    map['message'] = message;
    return map;
  }

}