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

  void _judgeGameResult() {
    const int kDefaultContinueCount = 1;
    int continueCount = kDefaultContinueCount;
    bool isGameOver = false;
    List<int> directions = [1, 15];
    for (int direction in directions) {
      for (int j = 0; j < 15; j++) {
        for (int k = 0; k < 15; k++) {
          int index = 0;
          if (direction == 1) {
            index = j * 15 + k;
          } else if (direction == 15) {
            index = k * 15 + j;
          }
          final CellStatus status = state.cellStatuses[index];
          if (index >= 225 - direction) {
            break;
          }
          final int nextIndex = index + direction;
          final CellStatus nextStatus = state.cellStatuses[nextIndex];
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
        print('ゲーム終了');
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
