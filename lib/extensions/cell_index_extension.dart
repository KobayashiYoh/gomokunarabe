import 'package:gomokunarabe/constants/cell_index.dart';

extension CellIndexExtension on int {
  bool get isErrorCellIndex =>
      this < CellIndex.minIndex || this > CellIndex.maxIndex;
  bool get isNotErrorCellIndex => !isErrorCellIndex;

  bool get isWallIndex =>
      (this >= CellIndex.minIndex && this <= 16) ||
      (this >= 272 && this <= CellIndex.maxIndex) ||
      (isNotErrorCellIndex && this % 17 == 0) ||
      (isNotErrorCellIndex && (this + 1) % 17 == 0);
  bool get isNotWallIndex => !isWallIndex;

  bool get isTopLeftCellIndex => this == 18;
  bool get isTopRightCellIndex => this == 32;
  bool get isBottomLeftCellIndex => this == 256;
  bool get isBottomRightCellIndex => this == 270;

  bool get isTopSideCellIndex => this >= 18 && this <= 32;
  bool get isBottomSideCellIndex => this >= 256 && this <= 270;

  bool get isLeftSideCellIndex => isNotWallIndex && (this - 1) % 17 == 0;
  bool get isRightSideCellIndex => isNotWallIndex && (this + 2) % 17 == 0;

  bool get isInsideWithDotCellIndex =>
      this == 72 || this == 80 || this == 208 || this == 216;
}
