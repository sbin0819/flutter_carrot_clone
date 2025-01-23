import 'package:bamtol_market_app/src/common/components/app_font.dart';
import 'package:bamtol_market_app/src/common/components/checkbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class ProductWritePage extends StatelessWidget {
  const ProductWritePage({super.key});

  Widget get _divider => Divider(
        color: Color(0xff3c3c3e),
        indent: 25,
        endIndent: 25,
      );

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
            _divider,
            _ProductTitleView(),
            _divider,
            _CategorySelectView(),
            _divider,
            _PriceSettingView(),
            _divider,
            _ProductDescription(),
            Container(
              height: 5,
              color: Color.fromARGB(255, 12, 12, 15),
            ),
            _HopeTradeLocationMap(),
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

class _ProductTitleView extends StatelessWidget {
  const _ProductTitleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        decoration: InputDecoration(
          hintText: '글 제목',
          hintStyle: TextStyle(
            color: Color(0xff6d7179),
            fontSize: 16.0,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
        onChanged: (v) {},
      ),
    );
  }
}

class _CategorySelectView extends StatelessWidget {
  const _CategorySelectView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: GestureDetector(
        onTap: () {},
        behavior: HitTestBehavior.translucent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppFont(
              '카테고리 선택',
              size: 16.0,
              color: Colors.white,
            ),
            SvgPicture.asset('assets/svg/icons/right.svg'),
          ],
        ),
      ),
    );
  }
}

class _PriceSettingView extends StatelessWidget {
  const _PriceSettingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: '₩ 가격 (선택 사항)',
                hintStyle: TextStyle(
                  color: Color(0xff6d7179),
                  fontSize: 16.0,
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (v) {},
            ),
          ),
          CheckBox(
            label: '나눔',
            isChecked: true,
            toggleCallBack: () {},
          )
        ],
      ),
    );
  }
}

class _ProductDescription extends StatelessWidget {
  const _ProductDescription({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        decoration: InputDecoration(
          hintText: '아라동에 올린 게시글 내용을 작성해주세요.\n(판매 금지 물품은 게시가 제한될 수 있어요.)',
          hintStyle: TextStyle(
            color: Color(0xff6d7179),
            fontSize: 16.0,
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide.none,
          ),
        ),
        keyboardType: TextInputType.multiline,
        maxLines: 10,
        onChanged: (v) {},
      ),
    );
  }
}

class _HopeTradeLocationMap extends StatelessWidget {
  const _HopeTradeLocationMap({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: GestureDetector(
        onTap: () {},
        behavior: HitTestBehavior.translucent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppFont(
              '거래 희망 장소',
              size: 16.0,
              color: Colors.white,
            ),
            Row(
              children: [
                AppFont(
                  '장소 선택',
                  size: 13.0,
                  color: Color(0xff6d7179),
                ),
                SvgPicture.asset('assets/svg/icons/right.svg'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
