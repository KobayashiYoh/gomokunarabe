import 'package:gomokunarabe/constants/image_paths.dart';
import 'package:gomokunarabe/models/cell_ui_type.dart';
import 'package:test/test.dart';

void main() {
  group('CellUITypeExtension', () {
    test('backgroundImagePath', () {
      expect(CellUIType.topLeft.backgroundImagePath, ImagePaths.cellTopLeft);
      expect(CellUIType.topSide.backgroundImagePath, ImagePaths.cellTopSide);
      expect(CellUIType.topRight.backgroundImagePath, ImagePaths.cellTopRight);
      expect(CellUIType.leftSide.backgroundImagePath, ImagePaths.cellLeftSide);
      expect(CellUIType.inside.backgroundImagePath, ImagePaths.cellInside);
      expect(
          CellUIType.rightSide.backgroundImagePath, ImagePaths.cellRightSide);
      expect(
          CellUIType.bottomLeft.backgroundImagePath, ImagePaths.cellBottomLeft);
      expect(
          CellUIType.bottomSide.backgroundImagePath, ImagePaths.cellBottomSide);
      expect(CellUIType.bottomRight.backgroundImagePath,
          ImagePaths.cellBottomRight);
      expect(CellUIType.insideWithDot.backgroundImagePath,
          ImagePaths.cellInsideWithDot);
      expect(CellUIType.none.backgroundImagePath, '');
    });
  });

  group('indexToCellUIType', () {
    test('valid index', () {
      expect(indexToCellUIType(18), CellUIType.topLeft);
      expect(indexToCellUIType(19), CellUIType.topSide);
      expect(indexToCellUIType(32), CellUIType.topRight);
      expect(indexToCellUIType(35), CellUIType.leftSide);
      expect(indexToCellUIType(144), CellUIType.inside);
      expect(indexToCellUIType(49), CellUIType.rightSide);
      expect(indexToCellUIType(256), CellUIType.bottomLeft);
      expect(indexToCellUIType(257), CellUIType.bottomSide);
      expect(indexToCellUIType(270), CellUIType.bottomRight);
      expect(indexToCellUIType(72), CellUIType.insideWithDot);
    });

    test('invalid index', () {
      expect(() => indexToCellUIType(-1), throwsA(isA<ArgumentError>()));
      expect(() => indexToCellUIType(289), throwsA(isA<ArgumentError>()));
    });
  });
}
