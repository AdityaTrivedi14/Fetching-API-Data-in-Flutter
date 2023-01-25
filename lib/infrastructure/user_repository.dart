import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import '../common/strings.dart';
import '../common/api_endpoints.dart';
import '../domain/user_data_models.dart';

class UserRepository {
  final Dio dioInstance = Dio();

  Future<Either<String, UserData>> fetchUserData() async {
    try {
      Response responseData = await dioInstance.get(ApiEndpoints.userDataURL);
      if (responseData.statusCode == 200) {
        UserData userInfo = UserData.fromJson(responseData.data);
        debugPrint(responseData.toString());
        return right(userInfo);
      } else {
        return left(errorStringWrong);
      }
    } catch (e) {
      return left(errorStringWrong);
    }
  }
}
