import 'package:flutter/material.dart';
import 'package:trauxit_test/utilities/constance/colors.dart';
import 'package:trauxit_test/utilities/constance/custome_text.dart';
import 'package:trauxit_test/utilities/constance/default_network_image.dart';
import 'package:trauxit_test/utilities/shared_component/miuns_plus_widget.dart';

class CartCardWidget extends StatelessWidget {
  const CartCardWidget({
    super.key,
    this.removeOnpressed,
    required this.image,
    this.subTitle,
    this.title,
    this.counter,
    this.miunsOnPressed,
    this.plusOnPressed,
    this.onTap,
    this.needRemove = true,
    this.needMinusPlus = true,
  });
  final void Function()? removeOnpressed;
  final String image;
  final String? title;
  final String? subTitle;
  final String? counter;
  final void Function()? miunsOnPressed;
  final void Function()? plusOnPressed;
  final void Function()? onTap;
  final bool needRemove;
  final bool needMinusPlus;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      color: SharedColor.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: SharedColor.primaryColor,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: InkWell(
              onTap: onTap ?? () {},
              child: Card(
                color: SharedColor.transparent,
                elevation: 0,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DefaultNetworkImage(
                  image,
                  height: 120,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Column(
                children: [
                  if (title != null)
                    CustomeHeadlineText(
                      title ?? "",
                      color: SharedColor.black,
                      fontWeight: FontWeight.bold,
                    ),
                  if (subTitle != null)
                    CustomeHeadlineText(
                      subTitle ?? "",
                      color: SharedColor.grey,
                      fontWeight: FontWeight.w400,
                    ),
                ],
              )),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: removeOnpressed ?? () {},
                icon: needRemove
                    ? Icon(
                        Icons.remove,
                        color: SharedColor.red,
                        size: 16,
                      )
                    : const SizedBox(),
              ),
              needMinusPlus
                  ? MinusPlusWidget(
                      borderColor: SharedColor.black,
                      counterColor: SharedColor.red,
                      counter: counter,
                      miunsOnPressed: miunsOnPressed ?? () {},
                      plusOnPressed: plusOnPressed ?? () {},
                    )
                  : const SizedBox(),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
