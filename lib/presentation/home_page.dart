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
      body: SingleChildScrollView(
        child: GetBuilder<HomeController>(
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
                child: Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: ListView.builder(
                        // scrollDirection: Axis.vertical,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: 14,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Get.toNamed('/detail');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: const Color(0xffD9D9D9),
                              ),
                              height: 60,
                              margin: const EdgeInsets.only(
                                bottom: 10,
                              ),
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // OnTap
                                    Text(
                                        'Temprature is ${controllerState.userData.rating?.rate}'),
                                    Text('Name'),
                                  ]),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}
