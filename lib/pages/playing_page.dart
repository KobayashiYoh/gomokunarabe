import 'package:flutter/material.dart';
import 'package:gomokunarabe/components/app_colors.dart';
import 'package:gomokunarabe/components/board_cell.dart';

class PlayingPage extends StatelessWidget {
  const PlayingPage({Key? key}) : super(key: key);

  int cellIndex(int i, int j) {
    return i * kBoardLength + j;
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(deviceWidth / 36),
            color: AppColors.cellBackground,
            height: deviceWidth,
            child: Column(
              children: [
                for (int i = 0; i < kBoardLength; i++)
                  Expanded(
                    child: Row(
                      children: [
                        for (int j = 0; j < kBoardLength; j++)
                          Expanded(
                            child: BoardCell(
                              index: cellIndex(i, j),
                            ),
                          ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const int kBoardLength = 15;
