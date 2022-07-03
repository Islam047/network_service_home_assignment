import 'dart:convert';

/// id : 1
/// employee_name : "Tiger Nixon"
/// employee_salary : 320800
/// employee_age : 61
/// profile_image : ""

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());
class Data {
  Data({
    this.id,
    this.employeeName,
    this.employeeSalary,
    this.employeeAge,
    this.profileImage,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    employeeName = json['employee_name'];
    employeeSalary = json['employee_salary'];
    employeeAge = json['employee_age'];
    profileImage = json['profile_image'];
  }
  int? id;
  String? employeeName;
  int? employeeSalary;
  int? employeeAge;
  String? profileImage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['employee_name'] = employeeName;
    map['employee_salary'] = employeeSalary;
    map['employee_age'] = employeeAge;
    map['profile_image'] = profileImage;
    return map;
  }

}