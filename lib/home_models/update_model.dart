import 'DataAssignment.dart';

class UpdateEmployee {
  UpdateEmployee({
    this.status,
    this.data,
    this.message,
  });

  UpdateEmployee.fromJson(dynamic json) {
    status = json['status'];
    data = List<DataAssignment>.from(
        json['data'].map((e) => DataAssignment.fromJson(e)));
    message = json['message'];
  }

  String? status;
  List<DataAssignment>? data;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['data'] = List<dynamic>.from(data!.map((e) => e.toJson()));
    map['message'] = message;
    return map;
  }
}
