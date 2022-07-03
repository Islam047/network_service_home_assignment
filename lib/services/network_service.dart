import 'dart:convert';

import 'package:http/http.dart';
import 'package:network_service_home_assignment/model/Employee.dart';

class NetworkService {
  /* API header */
  static Map<String, String> header = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  /* API base url */
  static const String BASE = 'dummy.restapiexample.com';

  /* API lists */

  static const String API_LIST = '/api/v1/employees';
  static const String API_GET_ONE = '/api/v1/employee/'; //{id}
  static const String API_POST = '/api/v1/create';
  static const String API_PUT = '/api/v1/update/'; // {id}
  static const String API_DELETE = '/api/v1/delete/'; // {id}

  /* API Methods */

  static Future<String?> GET(String api, Map<String, String> params) async {
    Uri uri = Uri.https(BASE, api, params);
    Response response = await get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DELETE(String api, Map<String, String> params) async {
    Uri uri = Uri.https(BASE, api, params);
    Response response = await delete(uri);
    if (response.statusCode == 200) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, dynamic> params) async {
    Uri uri = Uri.https(BASE, api);
    Response response =
        await put(uri, headers: header, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, dynamic> params) async {
    Uri uri = Uri.https(BASE, api);
    Response response =
        await post(uri, headers: header, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

/* API params */
  static Map<String, String> paramsEmpty() {
    Map<String, String> map = {};
    return map;
  }

  static Map<String, dynamic> paramsUpdate(Data data) {
    Map<String, dynamic> map = {};
    map.addAll({
      'employee_name': data.employeeName!,
      'employee_salary': data.employeeSalary,
      'employee_age': data.employeeAge,
      'profile_image': data.profileImage,
    });

    return map;
  }

  static Map<String, dynamic> paramsPost(Data data) {
    Map<String, dynamic> map = {};
    map.addAll({
      'employee_name': data.employeeName!,
      'employee_salary': data.employeeSalary,
      'employee_age': data.employeeAge,
      'profile_image': data.profileImage,
    });

    return map;
  }
}
