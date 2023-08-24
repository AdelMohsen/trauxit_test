import 'package:flutter/material.dart';
import 'package:trauxit_test/utilities/constance/colors.dart';
import 'package:trauxit_test/utilities/constance/custome_text.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
    this.needText = false,
  });
  final bool needText;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (needText) const Icon(Icons.hourglass_empty),
          if (needText)
            CustomeHeadlineText(
              'No Data Found',
              textAlign: TextAlign.center,
              fontSize: 15,
              maxLines: 1,
              color: SharedColor.black,
            ),
        ],
      ),
    );
  }
}
