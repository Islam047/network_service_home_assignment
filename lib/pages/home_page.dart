import 'package:flutter/material.dart';

import '../model/Employee.dart';
import '../services/network_service.dart';

class HomePage extends StatefulWidget {
  static const String id = '/home_page';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? data;

  @override
  void initState() {
    super.initState();
    Data data = Data(
        id: 1,
        employeeName: 'Islam',
        employeeSalary: 9999999,
        employeeAge: 21,
        profileImage: '');
        // apiGetAll();
        // apiGetOne();
        // apiDelete();
        // apiUpdateData(data);
        // apiPostData(data);
  }
// to get only all data
  void apiGetAll() async {
    NetworkService.GET(NetworkService.API_LIST, NetworkService.paramsEmpty())
        .then((response) => {
              showResponse(response ?? 'no data'),
            });
  }
// to get only one data
  void apiGetOne() async {
    NetworkService.GET(NetworkService.API_GET_ONE + 1.toString(),
            NetworkService.paramsEmpty())
        .then((response) => {
              showResponse(response ?? 'no data'),
            });
  }
// to delete data
  void apiDelete() async {
    NetworkService.DELETE(NetworkService.API_DELETE + 1.toString(),
            NetworkService.paramsEmpty())
        .then((response) => {
              showResponse(response ?? 'no data'),
            });
  }
// to update data
  void apiUpdateData(Data data) async {
    NetworkService.PUT(NetworkService.API_PUT + data.id.toString(),
            NetworkService.paramsUpdate(data))
        .then((response) => {showResponse(response ?? 'No data')});
  }
// to post data
  void apiPostData(Data data) async {
    NetworkService.POST(NetworkService.API_POST,
            NetworkService.paramsPost(data))
        .then((response) => {showResponse(response ?? 'no data')});
  }
 // to attach data String to coming api data
  void showResponse(String response) {
    setState(() {
      data = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('To Delete data'),
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Text(
                data ?? 'no data',
                style: const TextStyle(color: Colors.black, fontSize: 20),
              ),
            ],
          ),
        ));
  }
}
