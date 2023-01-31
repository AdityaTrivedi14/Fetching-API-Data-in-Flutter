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
                            child: Card(
                              // borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 234, 234, 234),
                              elevation: 4,
                              // height: 60,
                              margin: const EdgeInsets.only(
                                bottom: 10,
                              ),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                ),
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // OnTap
                                      Text(controllerState.userData[index].title
                                          .toString()),
                                      const SizedBox(
                                        height: 4,
                                      ),
                                      // Text(
                                      //     'Price: ${controllerState.userData[0].body}'),
                                    ]),
                              ),
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
