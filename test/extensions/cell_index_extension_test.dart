import 'package:gomokunarabe/extensions/cell_index_extension.dart';
import 'package:test/test.dart';

void main() {
  group('CellIndexExtension', () {
    test('isErrorCellIndex', () {
      expect((-1).isErrorCellIndex, true);
      expect(0.isErrorCellIndex, false);
      expect(288.isErrorCellIndex, false);
      expect(289.isErrorCellIndex, true);
    });

    test('isNotErrorCellIndex', () {
      expect((-1).isNotErrorCellIndex, false);
      expect(0.isNotErrorCellIndex, true);
      expect(288.isNotErrorCellIndex, true);
      expect(289.isNotErrorCellIndex, false);
    });

    test('isWallIndex', () {
      expect((-1).isWallIndex, false);
      expect(0.isWallIndex, true);
      expect(16.isWallIndex, true);
      expect(17.isWallIndex, true);
      expect(18.isWallIndex, false);
      expect(32.isWallIndex, false);
      expect(33.isWallIndex, true);
      expect(255.isWallIndex, true);
      expect(256.isWallIndex, false);
      expect(270.isWallIndex, false);
      expect(271.isWallIndex, true);
      expect(272.isWallIndex, true);
      expect(273.isWallIndex, true);
      expect(288.isWallIndex, true);
      expect(289.isWallIndex, false);
    });

    test('isNotWallIndex', () {
      expect((-1).isNotWallIndex, true);
      expect(0.isNotWallIndex, false);
      expect(16.isNotWallIndex, false);
      expect(17.isNotWallIndex, false);
      expect(18.isNotWallIndex, true);
      expect(32.isNotWallIndex, true);
      expect(33.isNotWallIndex, false);
      expect(255.isNotWallIndex, false);
      expect(256.isNotWallIndex, true);
      expect(270.isNotWallIndex, true);
      expect(271.isNotWallIndex, false);
      expect(272.isNotWallIndex, false);
      expect(273.isNotWallIndex, false);
      expect(288.isNotWallIndex, false);
      expect(289.isNotWallIndex, true);
    });

    test('isTopLeftCellIndex', () {
      expect(17.isTopLeftCellIndex, false);
      expect(18.isTopLeftCellIndex, true);
      expect(19.isTopLeftCellIndex, false);
    });

    test('isTopRightCellIndex', () {
      expect(31.isTopRightCellIndex, false);
      expect(32.isTopRightCellIndex, true);
      expect(33.isTopRightCellIndex, false);
    });

    test('isBottomLeftCellIndex', () {
      expect(255.isBottomLeftCellIndex, false);
      expect(256.isBottomLeftCellIndex, true);
      expect(257.isBottomLeftCellIndex, false);
    });

    test('isBottomRightCellIndex', () {
      expect(269.isBottomRightCellIndex, false);
      expect(270.isBottomRightCellIndex, true);
      expect(271.isBottomRightCellIndex, false);
    });

    test('isTopSideCellIndex', () {
      expect(17.isTopSideCellIndex, false);
      expect(18.isTopSideCellIndex, true);
      expect(32.isTopSideCellIndex, true);
      expect(33.isTopSideCellIndex, false);
    });

    test('isBottomSideCellIndex', () {
      expect(255.isBottomSideCellIndex, false);
      expect(256.isBottomSideCellIndex, true);
      expect(270.isBottomSideCellIndex, true);
      expect(271.isBottomSideCellIndex, false);
    });

    test('isLeftSideCellIndex', () {
      expect(1.isLeftSideCellIndex, false);
      expect(17.isLeftSideCellIndex, false);
      expect(18.isLeftSideCellIndex, true);
      expect(19.isLeftSideCellIndex, false);
      expect(255.isLeftSideCellIndex, false);
      expect(256.isLeftSideCellIndex, true);
      expect(257.isLeftSideCellIndex, false);
      expect(273.isLeftSideCellIndex, false);
    });

    test('isRightSideCellIndex', () {
      expect(15.isRightSideCellIndex, false);
      expect(31.isRightSideCellIndex, false);
      expect(32.isRightSideCellIndex, true);
      expect(33.isRightSideCellIndex, false);
      expect(269.isRightSideCellIndex, false);
      expect(270.isRightSideCellIndex, true);
      expect(271.isRightSideCellIndex, false);
      expect(287.isRightSideCellIndex, false);
    });

    test('isInsideWithDotCellIndex', () {
      expect(71.isInsideWithDotCellIndex, false);
      expect(72.isInsideWithDotCellIndex, true);
      expect(73.isInsideWithDotCellIndex, false);
      expect(79.isInsideWithDotCellIndex, false);
      expect(80.isInsideWithDotCellIndex, true);
      expect(81.isInsideWithDotCellIndex, false);
      expect(207.isInsideWithDotCellIndex, false);
      expect(208.isInsideWithDotCellIndex, true);
      expect(209.isInsideWithDotCellIndex, false);
      expect(215.isInsideWithDotCellIndex, false);
      expect(216.isInsideWithDotCellIndex, true);
      expect(217.isInsideWithDotCellIndex, false);
    });
  });
}
