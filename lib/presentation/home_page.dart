import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../common/widgets/loading_spinner.dart';
import '../application/home_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      // body: GetBuilder<HomeController>(
      //     init: HomeController(),
      //     builder: (controllerState) {
      //       if (controllerState.loading) {
      //         return const LoadingSpinner();
      //       } else if (controllerState.isError) {
      //         return Center(
      //           child: Text(
      //             controllerState.errorMessage,
      //           ),
      //         );
      //       } else {
      //         return Container(
      //           padding: const EdgeInsets.all(10),
      //           child: Column(
      //             children: [
      //               Text('Our temp is ${controllerState.userData.main?.temp}')
      //             ],
      //           ),
      //         );
      //       }
      //     }),
      body: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controllerState) {
            if (controllerState.loading) {
              return const LoadingSpinner();
            } else if (controllerState.isError) {
              return Center(
                child: Text(controllerState.errorMessage),
              );
            }
            return Container(
              padding: const EdgeInsets.all(10),
              child: Column(children: [
                Text('Temprature is ${controllerState.userData.main?.temp}')
              ]),
            );
          }),
    );
  }
}
