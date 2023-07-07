import 'package:gomokunarabe/extensions/cell_index_extension.dart';
import 'package:gomokunarabe/models/cell_status.dart';
import 'package:gomokunarabe/models/playing_state.dart';
import 'package:gomokunarabe/providers/playing_notifier.dart';
import 'package:test/test.dart';

void main() {
  group('PlayingNotifier', () {
    test('initial State', () {
      final PlayingNotifier notifier = PlayingNotifier();
      expect(notifier.debugState, kDefaultPlayingState);
    });

    test('switch turn', () {
      final PlayingNotifier notifier = PlayingNotifier();
      expect(notifier.debugState.isBlackTurn, true);
      notifier.onTapCell(18);
      expect(notifier.debugState.isBlackTurn, false);
      notifier.onTapCell(19);
      expect(notifier.debugState.isBlackTurn, true);
    });

    test('put black stone', () {
      final PlayingNotifier notifier = PlayingNotifier();
      notifier.onTapCell(18);
      expect(notifier.debugState.cellStatuses[18], CellStatus.black);
    });

    test('put white stone', () {
      final PlayingNotifier notifier = PlayingNotifier();
      notifier.onTapCell(18);
      notifier.onTapCell(19);
      expect(notifier.debugState.cellStatuses[19], CellStatus.white);
    });

    test('put black stones in all cells', () {
      for (int index = 18; index <= 270; index++) {
        if (index.isWallIndex) {
          continue;
        }
        final PlayingNotifier notifier = PlayingNotifier();
        notifier.onTapCell(index);
        expect(notifier.debugState.cellStatuses[index], CellStatus.black);
      }
    });

    test('put white stones in all cells', () {
      for (int index = 18; index <= 270; index++) {
        if (index.isWallIndex) {
          continue;
        }
        final PlayingNotifier notifier = PlayingNotifier();
        if (index == 18) {
          notifier.onTapCell(19);
          notifier.onTapCell(18);
        } else {
          notifier.onTapCell(18);
          notifier.onTapCell(index);
        }
        expect(notifier.debugState.cellStatuses[index], CellStatus.white);
      }
    });

    test('on tap wall cell', () {
      final PlayingNotifier notifier = PlayingNotifier();
      expect(notifier.debugState.isBlackTurn, true);
      notifier.onTapCell(17);
      expect(notifier.debugState.cellStatuses[17], CellStatus.wall);
      expect(notifier.debugState.isBlackTurn, true);
      notifier.onTapCell(18);
      expect(notifier.debugState.isBlackTurn, false);
      notifier.onTapCell(17);
      expect(notifier.debugState.cellStatuses[17], CellStatus.wall);
      expect(notifier.debugState.isBlackTurn, false);
    });

    test('on tap all wall cells in black turn', () {
      final PlayingNotifier notifier = PlayingNotifier();
      expect(notifier.debugState.isBlackTurn, true);
      for (int i = 0; i < notifier.debugState.cellStatuses.length; i++) {
        if (notifier.debugState.cellStatuses[i].isWall) {
          notifier.onTapCell(i);
        }
      }
    });

    test('on tap all wall cells in white turn', () {
      final PlayingNotifier notifier = PlayingNotifier();
      notifier.onTapCell(18);
      expect(notifier.debugState.isBlackTurn, false);
      for (int i = 0; i < notifier.debugState.cellStatuses.length; i++) {
        if (notifier.debugState.cellStatuses[i].isWall) {
          notifier.onTapCell(i);
          expect(notifier.debugState.cellStatuses[i], CellStatus.wall);
        }
      }
    });

    test('on tap stone', () {
      final PlayingNotifier notifier = PlayingNotifier();
      // 黒のターン、何も置かれていない18をタップ
      expect(notifier.debugState.isBlackTurn, true);
      notifier.onTapCell(18);
      expect(notifier.debugState.cellStatuses[18], CellStatus.black);
      // 白のターン、何も置かれていない19をタップ
      expect(notifier.debugState.isBlackTurn, false);
      notifier.onTapCell(19);
      expect(notifier.debugState.cellStatuses[19], CellStatus.white);
      // 黒のターン、黒が置いてある18をタップ
      expect(notifier.debugState.isBlackTurn, true);
      notifier.onTapCell(18);
      expect(notifier.debugState.cellStatuses[18], CellStatus.black);
      // 黒のターン、白が置いてある19をタップ
      expect(notifier.debugState.isBlackTurn, true);
      notifier.onTapCell(19);
      expect(notifier.debugState.cellStatuses[19], CellStatus.white);
      // 黒のターン、何も置かれていない20をタップ
      expect(notifier.debugState.isBlackTurn, true);
      notifier.onTapCell(20);
      expect(notifier.debugState.cellStatuses[20], CellStatus.black);
      // 白のターン、黒が置いてある18をタップ
      expect(notifier.debugState.isBlackTurn, false);
      notifier.onTapCell(18);
      expect(notifier.debugState.cellStatuses[18], CellStatus.black);
      // 白のターン、白が置いてある19をタップ
      expect(notifier.debugState.isBlackTurn, false);
      notifier.onTapCell(19);
      expect(notifier.debugState.cellStatuses[19], CellStatus.white);
    });
  });
}
