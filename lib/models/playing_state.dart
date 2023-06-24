import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gomokunarabe/models/cell_status.dart';

part 'playing_state.freezed.dart';

@freezed
class PlayingState with _$PlayingState {
  const factory PlayingState({
    required bool isBlackTurn,
    required List<CellStatus> cellStatuses,
  }) = _PlayingState;
}

final PlayingState kDefaultPlayingState = PlayingState(
  isBlackTurn: true,
  cellStatuses: List<CellStatus>.filled(225, CellStatus.empty),
);
