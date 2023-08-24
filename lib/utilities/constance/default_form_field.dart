import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trauxit_test/utilities/constance/colors.dart';
import 'package:trauxit_test/utilities/constance/custome_text.dart';

class DefaultFormField extends StatelessWidget {
  const DefaultFormField({
    super.key,
    this.hintText,
    this.labelText,
    this.onSaved,
    this.width,
    this.prefixIconData,
    this.prefixIcon,
    this.suffixIcon,
    this.needValidation = true,
    this.validator,
    this.keyboardType,
    this.obscureText = false,
    this.errorMaxLines,
    this.enabled = true,
    this.fillColor,
    this.borderColor,
    this.verticalEdge,
    this.initialValue,
    this.labelColor,
    this.maxLines,
    this.textColor,
    this.controller,
    this.onChanged,
    this.elevation,
    this.padding,
    this.margin,
    this.prefixIconConstraints,
    this.maxLength = -1,
    this.borderRadious,
    this.titleText,
    this.decoration,
    this.inputFormatters,
    this.onFieldSubmitted,
    this.textInputAction,
    this.onTapOutside,
    this.titleFontWeight,
    this.titleFontSize,
    this.autovalidateMode,
  });

  final String? labelText;
  final String? hintText;
  final void Function(String? newValue)? onSaved;
  final double? width;
  final IconData? prefixIconData;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? needValidation;
  final TextInputType? keyboardType;
  final String? Function(String? value)? validator;
  final bool? obscureText;
  final int? errorMaxLines;
  final bool? enabled;
  final Color? fillColor;
  final Color? borderColor;
  final double? verticalEdge;
  final String? initialValue;
  final Color? labelColor;
  final int? maxLines;
  final Color? textColor;
  final TextEditingController? controller;
  final void Function(String value)? onChanged;
  final double? elevation;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BoxConstraints? prefixIconConstraints;
  final int? maxLength;
  final double? borderRadious;
  final String? titleText;
  final InputDecoration? decoration;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String value)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final void Function(PointerDownEvent)? onTapOutside;
  final FontWeight? titleFontWeight;
  final double? titleFontSize;
  final AutovalidateMode? autovalidateMode;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? EdgeInsets.symmetric(vertical: verticalEdge ?? 4),
      child: SizedBox(
        width: width ?? MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (titleText != null)
              CustomeHeadlineText(
                titleText!,
                fontWeight: titleFontWeight ?? FontWeight.bold,
                fontSize: titleFontSize,
                color: SharedColor.white,
              ),
            Padding(
              padding: titleText != null
                  ? const EdgeInsetsDirectional.only(start: 6, bottom: 6)
                  : EdgeInsets.zero,
              child: TextFormField(
                onTapOutside: onTapOutside,
                textInputAction: textInputAction,
                maxLength: maxLength == -1 ? null : maxLength,
                inputFormatters: inputFormatters,
                cursorColor: SharedColor.primaryColor,
                cursorHeight: 20,
                cursorWidth: 1,
                validator: validator ??
                    (needValidation!
                        ? (value) =>
                            value!.isEmpty ? "this field is required" : null
                        : null),
                autovalidateMode:
                    autovalidateMode ?? AutovalidateMode.onUserInteraction,
                keyboardType: keyboardType,
                controller: controller,
                obscureText: obscureText!,
                enabled: enabled,
                onFieldSubmitted: onFieldSubmitted,
                initialValue: initialValue,
                onSaved: onSaved,
                maxLines: maxLines == -1 ? null : maxLines ?? 1,
                onChanged: onChanged,
                style: TextStyle(
                  color: textColor ?? SharedColor.black,
                ),
                decoration: decoration ??
                    InputDecoration(
                      filled: true,
                      fillColor: fillColor ?? SharedColor.transparent,
                      errorMaxLines: errorMaxLines,
                      suffixIcon: suffixIcon,
                      prefixIconConstraints: prefixIconConstraints,
                      prefixIcon: prefixIcon,
                      labelText: labelText,
                      labelStyle: TextStyle(color: labelColor ?? Colors.black),
                      hintStyle: TextStyle(
                          color: labelColor ?? SharedColor.grey, fontSize: 12),
                      hintText: hintText,
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: borderColor ?? const Color(0x28626262),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: borderColor ?? const Color(0x28626262),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: const BorderSide(
                          color: Color(0xFFFF0000),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(borderRadious ?? 8),
                        borderSide: BorderSide(
                          color: borderColor ?? SharedColor.primaryColor,
                        ),
                      ),
                      contentPadding: const EdgeInsetsDirectional.fromSTEB(
                          5.0, 5.0, 5.0, 5.0),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: borderColor ?? const Color(0xFFFF0000),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
