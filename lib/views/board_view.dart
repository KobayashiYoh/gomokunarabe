import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gomokunarabe/components/board_cell.dart';
import 'package:gomokunarabe/constants/app_colors.dart';
import 'package:gomokunarabe/providers/playing_notifier.dart';

class BoardView extends ConsumerWidget {
  const BoardView({Key? key}) : super(key: key);

  int cellIndex(int i, int j) {
    return i * 17 + j;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playingState = ref.watch(playingProvider);
    final playingNotifier = ref.read(playingProvider.notifier);
    final double deviceWidth = MediaQuery.of(context).size.width;
    return Container(
      // padding: EdgeInsets.all(deviceWidth / 36),
      color: AppColors.cellBackground,
      height: deviceWidth,
      child: Column(
        children: [
          for (int i = 0; i < 17; i++)
            Expanded(
              child: Row(
                children: [
                  for (int j = 0; j < 17; j++)
                    Expanded(
                      child: BoardCell(
                        onTap: () => playingNotifier.onTapCell(cellIndex(i, j)),
                        index: cellIndex(i, j),
                        status: playingState.cellStatuses[cellIndex(i, j)],
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

const int kBoardLength = 17;
