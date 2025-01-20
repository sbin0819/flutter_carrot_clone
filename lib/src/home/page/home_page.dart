import 'package:bamtol_market_app/src/common/components/app_font.dart';
import 'package:bamtol_market_app/src/common/controller/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: Get.width * 0.6,
        leading: Padding(
          padding: const EdgeInsets.only(left: 25.0),
          child: Row(
            children: [
              AppFont(
                '아라동',
                fontWeight: FontWeight.bold,
                size: 20.0,
                color: Colors.white,
              ),
              SizedBox(width: 10.0),
              SvgPicture.asset('assets/svg/icons/bottom_arrow.svg')
            ],
          ),
        ),
        actions: [
          SvgPicture.asset('assets/svg/icons/search.svg'),
          SizedBox(width: 15.0),
          SvgPicture.asset('assets/svg/icons/list.svg'),
          SizedBox(width: 15.0),
          SvgPicture.asset('assets/svg/icons/bell.svg'),
          SizedBox(width: 25.0),
        ],
      ),
      body: Center(
        child: GestureDetector(
          onTap: () {
            Get.find<AuthenticationController>().logout();
          },
          child: AppFont('홈'),
        ),
      ),
    );
  }
}
