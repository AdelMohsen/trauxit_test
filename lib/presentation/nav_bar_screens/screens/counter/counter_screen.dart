import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trauxit_test/logic/nav_bar_screens/counter/counter_with_provider.dart';
import 'package:trauxit_test/utilities/constance/colors.dart';
import 'package:trauxit_test/utilities/constance/custome_text.dart';
import 'package:trauxit_test/utilities/constance/default_button.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomeHeadlineText(
            'COUNTER WITH PROVIDER',
            fontSize: 25,
            color: SharedColor.black,
          ),
          CustomeHeadlineText('Count: ${counter.count}', fontSize: 24),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: DefaultButton(
                    onPressed: () => counter.increment(),
                    text: 'Increment',
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DefaultButton(
                    onPressed: () => counter.decrement(),
                    text: 'Decrement',
                    backgroundColor: SharedColor.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
