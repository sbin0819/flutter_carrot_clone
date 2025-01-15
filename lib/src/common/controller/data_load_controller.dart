import 'package:get/get.dart';

class DataLoadController extends GetxController {
  RxBool isDataLoad = false.obs;

  void loadData() async {
    await Future.delayed(const Duration(microseconds: 2000));
    isDataLoad(true);
  }
}
