import 'package:flutter/material.dart';
import 'package:gomokunarabe/components/stone.dart';
import 'package:gomokunarabe/constants/app_colors.dart';
import 'package:gomokunarabe/extensions/cell_index_extension.dart';
import 'package:gomokunarabe/models/cell_status.dart';
import 'package:gomokunarabe/models/cell_ui_type.dart';

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
          image: index.isWallIndex
              ? null
              : DecorationImage(
                  image: AssetImage(
                    indexToCellUIType(index).backgroundImagePath,
                  ),
                ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Stone(status: status),
            FittedBox(
              child: Text(
                index.toString(),
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
