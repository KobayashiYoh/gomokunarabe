import 'package:flutter/material.dart';
import 'package:gomokunarabe/components/app_colors.dart';
import 'package:gomokunarabe/models/cell_status.dart';
import 'package:gomokunarabe/models/cell_type.dart';

class BoardCell extends StatelessWidget {
  const BoardCell({
    Key? key,
    required this.onTap,
    required this.index,
    required this.status,
  }) : super(key: key);
  final void Function()? onTap;
  final int index;
  final CellStatus status;

  final minIndex = 0;
  final maxIndex = 224;

  String get argumentErrorMessage =>
      'Invalid index value. Please provide a value between $minIndex and $maxIndex.';

  CellType get cellType {
    if (index < minIndex || index > maxIndex) {
      throw ArgumentError(argumentErrorMessage);
    } else if (index == minIndex) {
      return CellType.topLeft;
    } else if (index == 14) {
      return CellType.topRight;
    } else if (index == 210) {
      return CellType.bottomLeft;
    } else if (index == maxIndex) {
      return CellType.bottomRight;
    } else if (index >= 1 && index <= 13) {
      return CellType.topSide;
    } else if (index >= 211 && index <= 223) {
      return CellType.bottomSide;
    } else if (index % 15 == 0) {
      return CellType.leftSide;
    } else if ((index - 14) % 15 == 0) {
      return CellType.rightSide;
    } else if (index == 48 || index == 56 || index == 168 || index == 176) {
      return CellType.insideWithDot;
    } else {
      return CellType.inside;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: AppColors.cellBackground,
          borderRadius: BorderRadius.circular(1.0),
          image: DecorationImage(
            image: AssetImage(cellType.imagePath),
          ),
        ),
        child: Text(status.text),
      ),
    );
  }
}
