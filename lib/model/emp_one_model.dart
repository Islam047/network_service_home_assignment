import 'package:network_service_home_assignment/model/data_model.dart';

class EmpOne{
  String? status;
  String? message;
  Data? data;
EmpOne(this.status,this.message,this.data);
  EmpOne.fromJson(Map<String,dynamic> json)  {
    status = json['status'];
    message = json['message'] ;
    data  = Data.fromJson(json['data']);
  }
  Map<String,dynamic> toJson() => {
    'status':status,
    'message':message,
    'data': data!.toJson(),
  };
}