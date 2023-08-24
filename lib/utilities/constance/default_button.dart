import 'package:flutter/material.dart';
import 'package:trauxit_test/utilities/constance/colors.dart';
import 'package:trauxit_test/utilities/constance/custome_text.dart';
import 'package:trauxit_test/utilities/constance/loading.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton({
    Key? key,
    this.backgroundColor,
    this.borderColor,
    this.borderRadius,
    this.child,
    this.onPressed,
    this.padding,
    this.text,
    this.borderRadiusValue,
    this.fontSize,
    this.elevation,
    this.side,
    this.textColor,
    this.isLoading = false,
    this.fontWeight,
  }) : super(key: key);

  final void Function()? onPressed;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final BorderRadiusGeometry? borderRadius;
  final Color? borderColor;
  final String? text;
  final Widget? child;
  final double? borderRadiusValue;
  final double? fontSize;
  final double? elevation;
  final MaterialStateProperty<BorderSide?>? side;
  final Color? textColor;
  final bool isLoading;
  final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? () {} : onPressed ?? () {},
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          backgroundColor ?? SharedColor.primaryColor,
        ),
        side: side,
        minimumSize: MaterialStateProperty.all(
            Size(MediaQuery.of(context).size.width, 45)),
        padding: MaterialStateProperty.all(
            padding ?? const EdgeInsets.symmetric(horizontal: 20)),
        elevation: MaterialStateProperty.all(elevation ?? 3),
        visualDensity: const VisualDensity(
          horizontal: .9,
          vertical: .8,
        ),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius:
                borderRadius ?? BorderRadius.circular(borderRadiusValue ?? 8),
            side: BorderSide(
                color:
                    borderColor ?? backgroundColor ?? SharedColor.primaryColor),
          ),
        ),
      ),
      child: isLoading
          ? const AdaptiveCircularProgress()
          : child ??
              CustomeHeadlineText(
                text ?? 'LOGIN',
                color: textColor ?? SharedColor.white,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
    );
  }
}
