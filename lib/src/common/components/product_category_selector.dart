import 'package:bamtol_market_app/src/common/components/app_font.dart';
import 'package:bamtol_market_app/src/common/enum/market_enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCategorySelector extends StatelessWidget {
  final ProductCategoryType? initType;
  const ProductCategorySelector({super.key, this.initType});

  @override
  Widget build(BuildContext context) {
    var types = ProductCategoryType.values
        .where((element) => element.code != '')
        .toList();

    return Material(
      color: Colors.black.withValues(alpha: 0.5),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            bottom: 0,
            child: GestureDetector(
              onTap: () {
                Get.back();
              },
              behavior: HitTestBehavior.translucent,
            ),
          ),
          Center(
            child: Padding(
              padding: EdgeInsets.all(25),
              child: Container(
                height: Get.height * 0.7,
                color: Color(0xff212123),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: List.generate(
                      types.length,
                      (index) => GestureDetector(
                        onTap: () {
                          Get.back(result: types[index]);
                        },
                        behavior: HitTestBehavior.translucent,
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: AppFont(
                            types[index].name,
                            color: initType == null
                                ? Colors.white
                                : initType?.code == types[index].code
                                    ? Color(0xfffd6f1f)
                                    : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
