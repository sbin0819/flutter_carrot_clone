import 'package:get/get.dart';

class BottomNavController extends GetxController {
  RxInt menuInt = 0.obs;

  void changeBottomNav(int index) {
    menuInt(index);
  }
}
