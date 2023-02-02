import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/application/home_controller.dart';
import 'package:my_app/domain/user_data_models.dart';

class DetailPage extends StatelessWidget {
  DetailPage({super.key});

  final args = Get.arguments;

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
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${args['title']}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                // Text('User Id: ${args['id']}'),
                // Text('User Id is ${args['userId']}'),
                const SizedBox(
                  height: 10,
                ),
                Text('${args['body']}'),
              ],
            ),
          );
        },
      ),
    );
  }
}
