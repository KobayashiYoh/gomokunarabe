import 'package:gomokunarabe/models/cell_status.dart';
import 'package:test/test.dart';

void main() {
  group('CellStatus', () {
    test('isBlack', () {
      expect(CellStatus.black.isBlack, true);
    });

    test('isWhite', () {
      expect(CellStatus.white.isWhite, true);
    });

    test('isEmpty', () {
      expect(CellStatus.empty.isEmpty, true);
    });

    test('isWall', () {
      expect(CellStatus.wall.isWall, true);
    });

    test('isNotEmpty', () {
      expect(CellStatus.black.isNotEmpty, true);
      expect(CellStatus.white.isNotEmpty, true);
      expect(CellStatus.wall.isNotEmpty, true);
      expect(CellStatus.empty.isNotEmpty, false);
    });

    test('isNotWall', () {
      expect(CellStatus.black.isNotWall, true);
      expect(CellStatus.white.isNotWall, true);
      expect(CellStatus.empty.isNotWall, true);
      expect(CellStatus.wall.isNotWall, false);
    });
  });
}
