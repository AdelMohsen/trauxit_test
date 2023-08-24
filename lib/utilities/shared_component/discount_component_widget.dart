import 'package:flutter/cupertino.dart';
import 'package:trauxit_test/utilities/constance/colors.dart';
import 'package:trauxit_test/utilities/constance/custome_text.dart';
import 'package:trauxit_test/utilities/constance/utils.dart';

class DiscountComponentWidget extends StatelessWidget {
  const DiscountComponentWidget({
    super.key,
    this.padding,
    this.bottomPadding,
    this.topPadding,
    required this.discount,
    this.color,
  });
  final EdgeInsetsGeometry? padding;
  final double? topPadding;
  final double? bottomPadding;
  final dynamic discount;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return isConstructorReturnValue(discount)
        ? Padding(
            padding: padding ??
                EdgeInsetsDirectional.only(
                    top: topPadding ?? 5.0, bottom: bottomPadding ?? 0),
            child: Container(
              color: color ?? SharedColor.white,
              child: Padding(
                padding: const EdgeInsets.all(1.0),
                child: CustomeHeadlineText(
                  '- ${double.parse(discount.toString()).truncate()} %',
                  color: SharedColor.red,
                  fontSize: 9,
                ),
              ),
            ),
          )
        : const SizedBox();
  }
}
