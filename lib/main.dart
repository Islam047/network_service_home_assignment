import 'package:flutter/material.dart';
import 'package:network_service_home_assignment/model/data_model.dart';
import 'package:network_service_home_assignment/pages/detail_page.dart';
import 'package:network_service_home_assignment/services/network_service.dart';

import 'pages/home_page.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      routes: {
        DetailPage.id: (context) => DetailPage(),
        HomePage.id: (context) => const HomePage(),
      },
    );
  }
}
