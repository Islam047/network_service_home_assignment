import 'package:flutter/material.dart';
import 'package:network_service_home_assignment/model/Employee.dart';
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
        HomePage.id: (context) => const HomePage(),
      },
    );
  }
}
