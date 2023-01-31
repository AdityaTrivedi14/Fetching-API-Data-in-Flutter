import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import '../domain/user_data_models.dart';
import '../infrastructure/user_repository.dart';

class HomeController extends GetxController {
  final UserRepository userRepository = UserRepository();

  bool loading = false;
  late List<UserData> userData;
  bool isError = false;
  String errorMessage = '';

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
  }

  fetchUserData() async {
    loading = true;
    update();
    Either<String, List<UserData>> userResponse =
        await userRepository.fetchUserData();
    userResponse.fold((l) {
      isError = true;
      errorMessage = l;
    }, (List<UserData> r) {
      userData = r;
    });
    loading = false;
    update();
  }
}
