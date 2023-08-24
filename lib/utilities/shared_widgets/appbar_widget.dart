import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trauxit_test/presentation/readme/readme_screen.dart';
import 'package:trauxit_test/utilities/constance/colors.dart';
import 'package:trauxit_test/utilities/constance/images_strings.dart';
import 'package:trauxit_test/utilities/constance/navigation.dart';

class CustomeAppBarWidget extends StatelessWidget {
  const CustomeAppBarWidget({
    super.key,
    this.backgroundColor,
    this.title,
    this.centerTitle,
    this.style,
  });
  final Color? backgroundColor;
  final Widget? title;
  final bool? centerTitle;
  final SystemUiOverlayStyle? style;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      surfaceTintColor: Colors.transparent,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: backgroundColor ?? SharedColor.white,
        statusBarBrightness: Brightness.light,
      ),
      backgroundColor: backgroundColor ?? SharedColor.white,
      centerTitle: centerTitle ?? false,
      title: title ??
          Image.asset(
            ImagePath.iconWithoutBackground,
            height: 50,
          ),
      actions: [
        InkWell(
          overlayColor: MaterialStateProperty.all(SharedColor.transparent),
          onTap: () {
            Move.nativeNavigatePush(context, const ReadmeScreen());
          },
          child: Card(
            elevation: 1,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            child: Image.asset(
              ImagePath.profileImage,
              height: 50,
              width: 50,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
