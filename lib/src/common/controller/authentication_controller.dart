import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  RxBool isLogined = false.obs;

  void authCheck() async {
    await Future.delayed(Duration(microseconds: 1000));
    isLogined(true);
  }

  void logout() {
    isLogined(false);
  }
}
