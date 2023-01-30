import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/application/home_controller.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Page'),
      ),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controllerState) {
          return Text('Temprature is ${controllerState.userData.rating?.rate}');
        },
      ),
    );
  }
}
