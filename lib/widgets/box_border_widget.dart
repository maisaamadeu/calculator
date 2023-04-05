import 'package:calculator/constants.dart';
import 'package:flutter/material.dart';

class BoxBorderWidget extends StatelessWidget {
  const BoxBorderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      width: 30.0,
      margin: EdgeInsets.only(left: 5, right: 3),
      decoration: BoxDecoration(
        color: kWhite,
        border: Border.all(
          color: kBlack,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(5),
        boxShadow: const [
          BoxShadow(
            color: kBlack,
            blurRadius: 0, // soften the shadow
            spreadRadius: 0, //extend the shadow
            offset: Offset(
              3.0, // Move to right 5  horizontally
              3.0, // Move to bottom 5 Vertically
            ),
          )
        ],
      ),
    );
  }
}
