import 'package:bamtol_market_app/src/common/components/app_font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CheckBox extends StatelessWidget {
  final String label;
  final bool isChecked;
  final Function() toggleCallBack;
  const CheckBox({
    super.key,
    required this.label,
    required this.toggleCallBack,
    this.isChecked = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleCallBack,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3),
              border: Border.all(
                color: isChecked ? Color(0xfffd6f1f) : Color(0xff3c3c3e),
              ),
              color: isChecked
                  ? Color(0xfffd6f1f)
                  : Color(0xff3c3c3e).withValues(alpha: 0),
            ),
            width: 24,
            height: 24,
            child: isChecked
                ? Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SvgPicture.asset('assets/svg/icons/checked.svg'))
                : Container(),
          ),
          SizedBox(width: 7),
          AppFont(
            label,
            size: 16.0,
            color: Colors.white,
          ),
        ],
      ),
    );
  }
}
