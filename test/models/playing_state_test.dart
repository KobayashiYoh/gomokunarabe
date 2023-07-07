import 'package:gomokunarabe/models/cell_status.dart';
import 'package:gomokunarabe/models/playing_state.dart';
import 'package:test/test.dart';

void main() {
  group('PlayingState', () {
    test('default isBlackTurn', () {
      expect(kDefaultPlayingState.isBlackTurn, true);
    });

    test('default cell statuses', () {
      for (CellStatus cellStatus in kDefaultPlayingState.cellStatuses) {
        if (cellStatus.isWall) {
          expect(cellStatus, CellStatus.wall);
        } else {
          expect(cellStatus, CellStatus.empty);
        }
      }
    });
  });
}
