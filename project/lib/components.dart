// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:project_ui_intro_screen/utils/colors.dart';

class GetStartBtn extends StatelessWidget {
  const GetStartBtn({
    Key? key,
    required this.size,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.only(top: 60),
        width: size.width / 1.5,
        height: size.height / 13,
        decoration: BoxDecoration(
          color: MyColors.btnColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            "Get Started Now",
            style: textTheme.headline4,
          ),
        ),
      ),
    );
  }
}

class SkipBTN extends StatelessWidget {
  const SkipBTN({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.onTap,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 60),
      width: size.width / 1.5,
      height: size.height / 13,
      decoration: BoxDecoration(
        border: Border.all(
          color: MyColors.btnBorderColor,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        splashColor: MyColors.btnBorderColor,
        child: Center(
          child: Text(
            "Skip",
            style: textTheme.headline3,
          ),
        ),
      ),
    );
  }
}
