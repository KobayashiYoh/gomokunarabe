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

  void onTapCell(int index) {
    if (state.cellStatuses[index].isNotEmpty) {
      return;
    }
    List<CellStatus> newStatuses = List.from(state.cellStatuses);
    newStatuses[index] =
        state.isBlackTurn ? CellStatus.black : CellStatus.white;
    _setCellStatuses(newStatuses);
    _switchTurn();
  }
}
