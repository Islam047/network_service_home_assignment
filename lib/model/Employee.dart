import 'dart:convert';
/// status : "success"
/// data : {"id":1,"employee_name":"Tiger Nixon","employee_salary":320800,"employee_age":61,"profile_image":""}
/// message : "Successfully! Record has been fetched."

Employee employeeFromJson(String str) => Employee.fromJson(json.decode(str));
String employeeToJson(Employee data) => json.encode(data.toJson());
class Employee {
  Employee({
      this.status, 
      this.data, 
      this.message,});

  Employee.fromJson(dynamic json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }
  String? status;
  Data? data;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    map['message'] = message;
    return map;
  }

}

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