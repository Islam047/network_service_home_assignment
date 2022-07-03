
import 'package:network_service_home_assignment/model/data_model.dart';

class EmpList{
  String? status;
  String? message;
  List<Data>? data;

  EmpList.fromJson(Map<String,dynamic> json){
    status = json['status'];
    message = json['message'];
    data = List<Data>.from(json['data'].map((e) => Data.fromJson(e)));

  }
  Map<String,dynamic> toJson() => {
    'status':status,
    'message':message,

    'data':List<Data>.from(data!.map((e) => e.toJson()))
  };
}
