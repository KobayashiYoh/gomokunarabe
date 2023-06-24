import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gomokunarabe/models/cell_status.dart';
import 'package:gomokunarabe/models/playing_state.dart';

final playingProvider =
    StateNotifierProvider<PlayingNotifier, PlayingState>((ref) {
  return PlayingNotifier();
});

class PlayingNotifier extends StateNotifier<PlayingState> {
  PlayingNotifier() : super(kDefaultPlayingState);

  void onTapCell(int index) {
    List<CellStatus> newStatuses = List.from(state.cellStatuses);
    newStatuses[index] =
        state.isBlackTurn ? CellStatus.black : CellStatus.white;
    state = state.copyWith(
      cellStatuses: newStatuses,
    );
  }
}
