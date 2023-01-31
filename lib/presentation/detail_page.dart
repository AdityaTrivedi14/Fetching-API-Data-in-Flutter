import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/application/home_controller.dart';
import 'package:my_app/domain/user_data_models.dart';

class DetailPage extends StatelessWidget {
  DetailPage({super.key});

  dynamic args = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details Page'),
      ),
      body: GetBuilder<HomeController>(
        // init: HomeController(),
        builder: (controllerState) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: 300,
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Card(
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Id is ${args['id']}'), //2
                  Text('User Id is ${args['userId']}'), //1
                  const SizedBox(
                    height: 10,
                  ),
                  Text('Title is ${args['title']}'), //dtrdy
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
