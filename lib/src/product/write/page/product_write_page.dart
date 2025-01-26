import 'package:bamtol_market_app/src/common/components/app_font.dart';
import 'package:bamtol_market_app/src/common/components/checkbox.dart';
import 'package:bamtol_market_app/src/common/components/multiful_image_view.dart';
import 'package:bamtol_market_app/src/common/components/textfield.dart';
import 'package:bamtol_market_app/src/product/write/controller/product_write_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:photo_manager/photo_manager.dart';

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SingleChildScrollView(
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
          ),
          Container(
            height: 40,
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Color(0xff3c3c3e),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SvgPicture.asset('assets/svg/icons/photo_small.svg'),
                SizedBox(width: 10),
                AppFont(
                  '0/10',
                  size: 13.0,
                  color: Colors.white,
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: FocusScope.of(context).unfocus,
            behavior: HitTestBehavior.translucent,
            child: SvgPicture.asset(
              'assets/svg/icons/keyboard-down.svg',
            ),
          ),
        ],
      ),
    );
  }
}

class _PhotoSelectedView extends GetView<ProductWriteController> {
  const _PhotoSelectedView({super.key});

  Widget _photoSelectIcon() {
    return GestureDetector(
      onTap: () async {
        var selectedImages = await Get.to<List<AssetEntity>?>(
          MultifulImageView(
            initImages: controller.selectedImages,
          ),
        );
        controller.changeSelectedImages(selectedImages);
      },
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
                Obx(
                  () => AppFont(
                    '${controller.selectedImages.length}',
                    size: 13.0,
                    color: Color(0xff868b95),
                  ),
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
      child: Obx(
        () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: controller.selectedImages.length,
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
                      child: FutureBuilder(
                        future: controller.selectedImages[index].file,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Image.file(
                              snapshot.data!,
                              fit: BoxFit.cover,
                            );
                          } else {
                            return Container();
                          }
                        },
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  child: GestureDetector(
                    onTap: () {
                      controller.deleteImage(index);
                    },
                    child: SvgPicture.asset('assets/svg/icons/remove.svg'),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 25),
      child: Row(
        children: [
          _photoSelectIcon(),
          Expanded(
            child: _selectedImageList(),
          )
        ],
      ),
    );
  }
}

class _ProductTitleView extends GetView<ProductWriteController> {
  const _ProductTitleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: CommonTextField(
        hintText: '글 제목.',
        onChange: controller.changeTitle,
        hintColor: Color(0xff6d7179),
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
            child: CommonTextField(
              hintColor: Color(0xff6d7179),
              hintText: '₩ 가격 (선택 사항)',
              textInputType: TextInputType.number,
              onChange: (v) {},
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
      child: CommonTextField(
        hintColor: Color(0xff6d7179),
        hintText: '아라동에 올린 게시글 내용을 작성해주세요.\n(판매 금지 물품은 게시가 제한될 수 있어요.)',
        textInputType: TextInputType.multiline,
        maxLines: 10,
        onChange: (v) {},
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
