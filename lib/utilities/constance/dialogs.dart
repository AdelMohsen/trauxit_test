import 'package:flutter/material.dart';
import 'package:trauxit_test/utilities/constance/colors.dart';
import 'package:trauxit_test/utilities/constance/custome_text.dart';

class Dialogs {
  static showSnackBar({
    String? title,
    required String bodyMessage,
    int status = 1,
    required BuildContext context,
  }) =>
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: CustomeHeadlineText(
            bodyMessage,
            color: SharedColor.white,
          ),
          duration: const Duration(
            seconds: 3,
          ),
          backgroundColor: status == 1 ? SharedColor.black : SharedColor.red,
        ),
      );
}
