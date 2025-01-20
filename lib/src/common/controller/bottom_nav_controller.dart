import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomNavController extends GetxController
    with GetTickerProviderStateMixin {
  late TabController tabController;
  RxInt menuInt = 0.obs;

  @override
  void onInit() {
    tabController = TabController(length: 5, vsync: this);
    super.onInit();
  }

  void changeBottomNav(int index) {
    menuInt(index);
    tabController.animateTo(index);
  }
}
