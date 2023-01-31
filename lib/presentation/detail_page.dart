import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/application/home_controller.dart';
import 'package:my_app/domain/user_data_models.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final userId = ModalRoute.of(context)!.settings.arguments as String;
    // final selectedId = Use
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Page'),
      ),
      body: GetBuilder<HomeController>(
        init: HomeController(),
        builder: (controllerState) {
          return Text('Temprature is ${controllerState.userData[0].userId}');
        },
      ),
    );
  }
}
