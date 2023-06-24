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
    for (int i = 0; i < 15; i++) {
      for (int j = 0; j < 15; j++) {
        final int index = i * 15 + j;
        final CellStatus status = state.cellStatuses[index];
        if (index >= 225 - 1) {
          break;
        }
        final int nextIndex = index + 1;
        final CellStatus nextStatus = state.cellStatuses[nextIndex];
        if (status.isNotEmpty && status == nextStatus) {
          continueCount++;
        } else {
          continueCount = kDefaultContinueCount;
        }
        if (continueCount >= 5) {
          break;
        }
      }
      if (continueCount >= 5) {
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
