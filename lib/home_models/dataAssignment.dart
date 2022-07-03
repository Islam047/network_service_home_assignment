import 'dart:convert';

class DataAssignment {
  DataAssignment({
      this.name, 
      this.salary, 
      this.age, 
      this.id,});

  DataAssignment.fromJson(dynamic json) {
    name = json['name'];
    salary = json['salary'];
    age = json['age'];
    id = json['id'];
  }
  String? name;
  String? salary;
  String? age;
  int? id;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['salary'] = salary;
    map['age'] = age;
    map['id'] = id;
    return map;
  }

}