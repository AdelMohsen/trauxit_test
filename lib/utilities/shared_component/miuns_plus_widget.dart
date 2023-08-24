import 'package:flutter/material.dart';
import 'package:trauxit_test/utilities/constance/colors.dart';
import 'package:trauxit_test/utilities/constance/custome_text.dart';

class MinusPlusWidget extends StatelessWidget {
  const MinusPlusWidget({
    Key? key,
    this.miunsOnPressed,
    this.plusOnPressed,
    this.counter,
    this.mainAxisAlignment,
    this.counterColor,
    this.minusIconColor,
    this.plusIconColor,
    this.borderColor,
    this.size,
    this.iconSize,
    this.needHorizontal = true,
    this.overlayColor,
  }) : super(key: key);

  final void Function()? miunsOnPressed;
  final void Function()? plusOnPressed;
  final String? counter;
  final MainAxisAlignment? mainAxisAlignment;
  final Color? minusIconColor;
  final Color? plusIconColor;
  final Color? counterColor;
  final Color? borderColor;
  final double? size;
  final double? iconSize;
  final bool? needHorizontal;
  final MaterialStateProperty<Color?>? overlayColor;
  @override
  Widget build(BuildContext context) {
    return needHorizontal!
        ? Column(
            mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: plusOnPressed ?? () {},
                overlayColor: overlayColor,
                child: Container(
                  height: size ?? 30,
                  width: size ?? 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: SharedColor.transparent,
                    border: Border.all(color: borderColor ?? SharedColor.black),
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.add,
                    size: iconSize ?? 14,
                    color: plusIconColor,
                  ),
                ),
              ),
              Container(
                height: size ?? 30,
                width: size ?? 30,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: SharedColor.transparent,
                  border: Border.all(color: borderColor ?? SharedColor.grey),
                ),
                alignment: Alignment.center,
                child: CustomeHeadlineText(
                  counter ?? '1',
                  color: counterColor,
                  fontSize: 15,
                ),
              ),
              InkWell(
                onTap: miunsOnPressed ?? () {},
                overlayColor: overlayColor,
                child: Container(
                  height: size ?? 30,
                  width: size ?? 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: SharedColor.transparent,
                    border: Border.all(color: borderColor ?? SharedColor.grey),
                  ),
                  alignment: Alignment.topCenter,
                  child: Icon(
                    Icons.minimize,
                    size: iconSize ?? 14,
                    color: minusIconColor,
                  ),
                ),
              ),
            ],
          )
        : Row(
            mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: miunsOnPressed ?? () {},
                overlayColor: overlayColor,
                child: Container(
                  height: size ?? 25,
                  width: size ?? 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: SharedColor.transparent,
                    border: Border.all(color: borderColor ?? SharedColor.grey),
                  ),
                  alignment: Alignment.topCenter,
                  child: Icon(
                    Icons.minimize,
                    size: iconSize ?? 14,
                    color: minusIconColor,
                  ),
                ),
              ),
              Container(
                height: size ?? 25,
                width: size ?? 25,
                margin: const EdgeInsets.symmetric(horizontal: 3),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: SharedColor.transparent,
                  border: Border.all(color: borderColor ?? SharedColor.grey),
                ),
                alignment: Alignment.center,
                child: CustomeHeadlineText(counter ?? '1', color: counterColor),
              ),
              InkWell(
                onTap: plusOnPressed ?? () {},
                overlayColor: overlayColor,
                child: Container(
                  height: size ?? 25,
                  width: size ?? 25,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: SharedColor.transparent,
                    border: Border.all(color: borderColor ?? SharedColor.grey),
                  ),
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.add,
                    size: iconSize ?? 14,
                    color: plusIconColor,
                  ),
                ),
              ),
            ],
          );
  }
}
