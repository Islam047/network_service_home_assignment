import 'DataAssignment.dart';

class CreateEmployee {
  String? status;
  DataAssignment? data;
  String? message;

  CreateEmployee.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = DataAssignment.fromJson(json['data']);
    message = json['message'];
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'data': data!.toJson(),
        'message': message,
      };
}
