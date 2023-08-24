import 'package:flutter/material.dart';
import 'package:trauxit_test/utilities/constance/colors.dart';

class CustomeSmallText extends StatelessWidget {
  const CustomeSmallText(
    this.text, {
    super.key,
    this.color,
    this.decoration,
    this.fontSize,
    this.fontWeight,
    this.maxFont,
    this.maxLines,
    this.minFont,
    this.style,
    this.textAlign,
    this.decorationColor,
  });
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? minFont;
  final double? maxFont;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final double? fontSize;
  final TextStyle? style;
  final Color? decorationColor;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          TextStyle(
              color: color ?? SharedColor.secondryColor,
              fontWeight: fontWeight ?? FontWeight.w400,
              decoration: decoration ?? TextDecoration.none,
              fontSize: fontSize,
              fontFamily: 'Gill Sans',
              decorationColor: decorationColor),
      maxLines: maxLines ?? 1000,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign ?? TextAlign.start,
    );
  }
}

class CustomeHeadlineText extends StatelessWidget {
  const CustomeHeadlineText(
    this.text, {
    super.key,
    this.backgroundColor,
    this.color,
    this.decoration,
    this.fontSize,
    this.fontWeight,
    this.foreground,
    this.height,
    this.letterSpacing,
    this.maxFont,
    this.maxLines,
    this.minFont,
    this.overflow,
    this.style,
    this.textAlign,
    this.wordSpacing,
    this.decorationColor,
  });
  final String text;
  final Color? color;
  final FontWeight? fontWeight;
  final double? minFont;
  final double? maxFont;
  final int? maxLines;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final double? fontSize;
  final TextStyle? style;
  final double? letterSpacing;
  final double? wordSpacing;
  final Color? backgroundColor;
  final double? height;
  final Paint? foreground;
  final Color? decorationColor;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style ??
          TextStyle(
            color: color ?? SharedColor.primaryColor,
            fontWeight: fontWeight ?? FontWeight.w400,
            decoration: decoration,
            fontSize: fontSize,
            wordSpacing: wordSpacing,
            letterSpacing: letterSpacing,
            backgroundColor: backgroundColor,
            height: height,
            foreground: foreground,
            fontFamily: 'Gill Sans',
            decorationColor: decorationColor,
          ),
      maxLines: maxLines ?? 1000,
      textAlign: textAlign,
      overflow: overflow ?? TextOverflow.ellipsis,
    );
  }
}

class CustomeTextButtonWidget extends StatelessWidget {
  const CustomeTextButtonWidget({
    super.key,
    this.fontColor,
    this.fontSize,
    this.fontWeight,
    this.hoverColor,
    this.onPressed,
    this.text,
    this.textAlign,
    this.padding,
  });
  final String? text;
  final void Function()? onPressed;
  final Color? hoverColor;
  final FontWeight? fontWeight;
  final Color? fontColor;
  final TextAlign? textAlign;
  final double? fontSize;
  final MaterialStateProperty<EdgeInsetsGeometry?>? padding;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed ?? () {},
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(5),
        overlayColor: MaterialStateProperty.all(
          hoverColor ?? SharedColor.transparent,
        ),
        padding: padding,
      ),
      child: CustomeHeadlineText(
        text ?? 'View ALL',
        fontSize: fontSize,
        color: fontColor ?? SharedColor.grey,
        fontWeight: fontWeight ?? FontWeight.w300,
        textAlign: textAlign,
      ),
    );
  }
}
