import 'package:bamtol_market_app/src/common/components/app_font.dart';
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
      body: _ProductList(),
      floatingActionButton: GestureDetector(
        onTap: () async {
          await Get.toNamed('/product/write');
        },
        behavior: HitTestBehavior.translucent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xffed7738),
              ),
              child: Row(
                children: [
                  SvgPicture.asset('assets/svg/icons/plus.svg'),
                  SizedBox(width: 6),
                  AppFont(
                    '글쓰기',
                    color: Colors.white,
                    size: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProductList extends StatelessWidget {
  const _ProductList({
    super.key,
  });

  Widget _productOne(int index) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(7.0),
          child: SizedBox(
            width: 100.0,
            height: 100.0,
            child: Image.network(
              'https://cdn.kgmaeil.net/news/photo/202007/245825_49825_2217.jpg',
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 15.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 10.0),
              AppFont(
                '풀무원 두부 300g',
                fontWeight: FontWeight.bold,
                size: 16.0,
                color: Colors.white,
              ),
              const SizedBox(height: 5.0),
              AppFont(
                '개발하는남자 | 2021.07.01',
                size: 12.0,
                color: Color(0xff878b93),
              ),
              const SizedBox(height: 5.0),
              Row(
                children: [
                  AppFont(
                    '나눔',
                    size: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                  const SizedBox(width: 10.0),
                  AppFont(
                    '💛',
                    size: 16.0,
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.only(left: 25.0, top: 20, right: 25.0),
      itemBuilder: (context, index) {
        return _productOne(index);
      },
      separatorBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Divider(
            color: Color(0xff3c3c3e),
          ),
        );
      },
      itemCount: 10,
    );
  }
}
