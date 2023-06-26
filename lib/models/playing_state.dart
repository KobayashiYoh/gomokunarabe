import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:gomokunarabe/extensions/cell_index_extension.dart';
import 'package:gomokunarabe/models/cell_status.dart';

part 'playing_state.freezed.dart';

@freezed
class PlayingState with _$PlayingState {
  const factory PlayingState({
    required bool isBlackTurn,
    required List<CellStatus> cellStatuses,
  }) = _PlayingState;
}

const int kAllCellCount = 289;
final PlayingState kDefaultPlayingState = PlayingState(
  isBlackTurn: true,
  cellStatuses: List<CellStatus>.generate(
    kAllCellCount,
    (index) => index.isWallIndex ? CellStatus.wall : CellStatus.empty,
  ),
);
