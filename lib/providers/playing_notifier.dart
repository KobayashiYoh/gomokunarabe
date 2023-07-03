import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gomokunarabe/models/cell_status.dart';
import 'package:gomokunarabe/models/playing_state.dart';

final playingProvider =
    StateNotifierProvider<PlayingNotifier, PlayingState>((ref) {
  return PlayingNotifier();
});

class PlayingNotifier extends StateNotifier<PlayingState> {
  PlayingNotifier() : super(kDefaultPlayingState);

  void _setCellStatuses(List<CellStatus> value) {
    state = state.copyWith(cellStatuses: value);
  }

  void _setIsBlackTurn(bool value) {
    state = state.copyWith(isBlackTurn: value);
  }

  void _switchTurn() {
    _setIsBlackTurn(!state.isBlackTurn);
  }

  void _gameSet() {
    print('ゲーム終了');
    if (state.isBlackTurn) {
      print('黒の勝利！');
    } else {
      print('白の勝利！');
    }
  }

  void _judgeGameResult() {
    const int kDefaultContinueCount = 1;
    int continueCount = kDefaultContinueCount;
    bool isGameOver = false;
    final cellStatuses = state.cellStatuses;
    final List<int> directions = [1, 17, 18, 18, 16, 16];
    final List<int> defaultRowIndex = [18, 18, 18, 35, 18, 32];
    final List<int> rowAdds = [17, 1, 1, 17, 1, 17];
    for (int dirIndex = 0; dirIndex < directions.length; dirIndex++) {
      final int direction = directions[dirIndex];
      for (int rowIndex = defaultRowIndex[dirIndex];
          cellStatuses[rowIndex].isNotWall;
          rowIndex += rowAdds[dirIndex]) {
        for (int index = rowIndex;
            cellStatuses[index].isNotWall;
            index += direction) {
          if (index >= 288 - direction) {
            break;
          }
          final int nextIndex = index + direction;
          final CellStatus status = cellStatuses[index];
          final CellStatus nextStatus = cellStatuses[nextIndex];
          if (status.isNotEmpty && status == nextStatus) {
            continueCount++;
          } else {
            continueCount = kDefaultContinueCount;
          }
          if (continueCount >= 5) {
            isGameOver = true;
            break;
          }
        }
        if (isGameOver) {
          break;
        }
      }
      if (isGameOver) {
        _gameSet();
        break;
      }
    }
  }

  void onTapCell(int index) {
    if (state.cellStatuses[index].isNotEmpty) {
      return;
    }
    List<CellStatus> newStatuses = List.from(state.cellStatuses);
    newStatuses[index] =
        state.isBlackTurn ? CellStatus.black : CellStatus.white;
    _setCellStatuses(newStatuses);
    _judgeGameResult();
    _switchTurn();
  }
}
