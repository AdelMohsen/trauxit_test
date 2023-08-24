import 'package:flutter/material.dart';
import 'package:trauxit_test/utilities/constance/colors.dart';
import 'package:trauxit_test/utilities/constance/custome_text.dart';
import 'package:trauxit_test/utilities/constance/default_network_image.dart';
import 'package:trauxit_test/utilities/shared_component/discount_component_widget.dart';

class ProductCardWidget extends StatelessWidget {
  const ProductCardWidget({
    Key? key,
    required this.imageUrl,
    this.height,
    this.bodyFlex,
    this.imageFlex,
    this.onTap,
    this.width,
    required this.newPrice,
    this.description,
    this.discountPercent,
    required this.productId,
    this.needFavIcon = false,
    this.title,
  }) : super(key: key);

  final String? title;
  final String imageUrl;
  final dynamic newPrice;
  final String? description;
  final String? discountPercent;
  final double? height;
  final int? imageFlex;
  final int? bodyFlex;
  final void Function()? onTap;
  final double? width;
  final String productId;
  final bool needFavIcon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      borderRadius: BorderRadius.circular(10),
      splashColor: SharedColor.transparent,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 2),
        elevation: 3,
        color: SharedColor.white,
        child: Card(
          margin: EdgeInsets.zero,
          color: SharedColor.white,
          elevation: 0,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: SizedBox(
            height: height,
            width: width ?? MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
//----------------------------------IMAGE&DISCOUNT----------------------------//
                Expanded(
                  flex: imageFlex ?? 2,
                  child: Stack(
                    alignment: AlignmentDirectional.topStart,
                    children: [
                      Card(
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: DefaultNetworkImage(imageUrl),
                      ),
                      DiscountComponentWidget(discount: discountPercent),
                    ],
                  ),
                ),
//------------------------------------BODY------------------------------------//
                Expanded(
                  flex: bodyFlex ?? 1,
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(start: 4, end: 2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: CustomeHeadlineText(
                              newPrice,
                              color: SharedColor.primaryColor,
                            )),
                          ],
                        ),
                        if (title != null)
                          CustomeHeadlineText(title ?? "",
                              color: SharedColor.black,
                              fontSize: 10,
                              maxLines: 2,
                              textAlign: TextAlign.start,
                              fontWeight: FontWeight.bold),
                        CustomeHeadlineText(description!,
                            color: SharedColor.grey,
                            fontSize: 10,
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            fontWeight: FontWeight.w400),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
