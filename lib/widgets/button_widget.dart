import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../constants.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget(
      {super.key,
      required this.action,
      required this.actionFunction,
      this.isDoubleWidth = false});

  final String action;
  final Function() actionFunction;
  final bool isDoubleWidth;

  @override
  Widget build(BuildContext context) {
    return StaggeredGridTile.count(
      crossAxisCellCount: isDoubleWidth ? 2 : 1,
      mainAxisCellCount: 1,
      child: InkWell(
        onTap: actionFunction,
        child: Ink(
          child: Container(
            margin: EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
              color: kWhite,
              border: Border.all(
                color: kBlack,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: kBlack,
                  blurRadius: 0, // soften the shadow
                  spreadRadius: 0, //extend the shadow
                  offset: Offset(
                    5.0, // Move to right 5  horizontally
                    5.0, // Move to bottom 5 Vertically
                  ),
                )
              ],
            ),
            child: Center(
              child: Text(
                action,
                style: TextStyle(
                  fontSize: 36,
                  fontFamily: 'Bungee',
                  color: kBlack,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
