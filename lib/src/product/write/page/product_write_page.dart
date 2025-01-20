import 'package:bamtol_market_app/src/common/components/app_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProductWritePage extends StatelessWidget {
  const ProductWritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: Get.back,
          child: Padding(
            padding: EdgeInsets.all(10),
            child: SvgPicture.asset('assets/svg/icons/close.svg'),
          ),
        ),
        centerTitle: true,
        title: AppFont(
          '내 물건 팔기',
          size: 18.0,
          fontWeight: FontWeight.bold,
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Padding(
              padding: EdgeInsets.all(10),
              child: AppFont(
                '완료',
                size: 16.0,
                fontWeight: FontWeight.bold,
                color: Color(0xffed7738),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _PhotoSelectedView(),
          ],
        ),
      ),
    );
  }
}

class _PhotoSelectedView extends StatelessWidget {
  const _PhotoSelectedView({super.key});

  Widget _photoSelectedIcon() {
    return GestureDetector(
      onTap: () async {},
      child: Container(
        width: 77,
        height: 77,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            color: Color(0xff42464e),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/svg/icons/camera.svg'),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppFont(
                  '0',
                  size: 13.0,
                  color: Color(0xff868b95),
                ),
                AppFont(
                  '/10',
                  size: 13.0,
                  color: Color(0xff868b95),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _selectedImageList() {
    return Container(
      margin: EdgeInsets.only(left: 15),
      height: 77,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 20),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: SizedBox(
                    width: 67,
                    height: 67,
                    child: Container(
                      color: Colors.red,
                      child: Center(
                        child: AppFont(
                          index.toString(),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: 10,
                child: GestureDetector(
                  onTap: () {},
                  child: SvgPicture.asset('assets/svg/icons/remove.svg'),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      child: Row(
        children: [
          _photoSelectedIcon(),
          Expanded(
            child: _selectedImageList(),
          )
        ],
      ),
    );
  }
}
