import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:trauxit_test/presentation/authentication/login_screen.dart';
import 'package:trauxit_test/utilities/constance/colors.dart';
import 'package:trauxit_test/utilities/constance/custome_text.dart';
import 'package:trauxit_test/utilities/constance/default_button.dart';
import 'package:trauxit_test/utilities/constance/navigation.dart';
import 'package:trauxit_test/utilities/shared_widgets/appbar_widget.dart';
import 'package:trauxit_test/utilities/shared_widgets/icon_with_oval_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: CustomeAppBarWidget(
            backgroundColor: SharedColor.primaryColor,
            style: SystemUiOverlayStyle.dark,
          )),
      body: Container(
        height: height,
        width: width,
        color: SharedColor.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //-----------------------ICON SECTION-----------------------------//
            const Expanded(child: IconWithOvalWidget()),
            //-----------------------TEXT SECTION-----------------------------//
            Expanded(
              child: Column(
                children: [
                  //---------------------BUTTONS-----------------------------//
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomeHeadlineText(
                          'TRAUXIT',
                          color: SharedColor.white,
                          textAlign: TextAlign.start,
                          fontWeight: FontWeight.w900,
                          fontSize: 55,
                        ).animate().scale().fade(),
                        CustomeHeadlineText(
                          'Get Started!',
                          color: SharedColor.primaryColor,
                          textAlign: TextAlign.start,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          letterSpacing: 2,
                        )
                            .animate(
                                onPlay: (controller) => controller.repeat())
                            .shimmer(
                                duration: 1200.ms, color: SharedColor.white)
                            .animate() // this wraps the previous Animate in another Animate
                            .scale()
                            .fade(),
                      ],
                    ),
                  ),
                  //---------------------BUTTONS-----------------------------//
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //-------------------------***---------------------------------//
                      DefaultButton(
                        text: 'Log in',
                        backgroundColor: SharedColor.primaryColor,
                        fontWeight: FontWeight.w900,
                        textColor: SharedColor.white,
                        fontSize: 20,
                        onPressed: () {
                          Move.nativeNavigatePush(context, LoginScreen());
                        },
                      ).animate().fadeIn(duration: 900.ms, delay: 300.ms).move(
                          begin: const Offset(0, 200),
                          curve: Curves.easeOutQuad),
                      const SizedBox(height: 15),
                    ],
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
