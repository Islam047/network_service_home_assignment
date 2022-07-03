import 'package:flutter/material.dart';

import '../model/data_model.dart';

class DetailPage extends StatefulWidget {
  static const String id = '/detail_page';
    Data? data;

    DetailPage({Key? key, this.data}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  void initState(){
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data!.id.toString()),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(widget.data!.employeeName!,style: const TextStyle(fontSize: 25),),
            Text(widget.data!.employeeSalary.toString(),style: const TextStyle(fontSize: 25),),
          ],
        ),
      ),
    );
  }
}
