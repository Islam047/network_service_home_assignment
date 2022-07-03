import 'package:flutter/material.dart';
import 'package:network_service_home_assignment/model/emp_model.dart';
import '../model/data_model.dart';
import '../services/network_service.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  static const String id = '/home_page';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
static  List<Data> items = [];
  bool isWaiting = true;
  var data = Data(
      id: 1,
      employeeName: 'Islam',
      employeeSalary: 9999999,
      employeeAge: 21,
      profileImage: '');

  @override
  void initState() {
    super.initState();
    apiGetAll();
  }

// to get only all data
  void apiGetAll() async {
   await NetworkService.GET(NetworkService.API_LIST, NetworkService.paramsEmpty())
        .then((response) => {
          showResponse(response!)});

  }

// to get only one data


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
    NetworkService.POST(
            NetworkService.API_POST, NetworkService.paramsPost(data))
        .then((response) => {showResponse(response ?? 'no data')});
  }

  // to attach data String to coming api data
  void showResponse(String response) {
        try{
          if(response.isNotEmpty){
            setState((){
              isWaiting = false;
            });
            EmpList empList = NetworkService.parseEmpList(response);
            setState(() {
              items = empList.data!;

            });
          }
        }catch(e){
          print('No data');
        }


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Employee List'),
        ),
        body:  Stack(
          children: [
            Center(
              child: Visibility(visible: isWaiting,child: const CircularProgressIndicator(),),
            ),
            ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {

                  return itemsOfList(items[index],index);
                },),
          ],
        ),);
  }

  Widget itemsOfList(Data item,int index) {
    return GestureDetector(

      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) {
         return  DetailPage(data: items[index],);
       }));

      },
      child: Container(
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.only(bottom: 1),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${item.employeeName!} ${item.employeeAge}',
              style: const TextStyle(color: Colors.black, fontSize: 20),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              '${item.employeeSalary} \$ ${item.employeeAge}',
              style: const TextStyle(color: Colors.black, fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
