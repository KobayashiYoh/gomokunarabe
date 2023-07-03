import 'package:gomokunarabe/constants/cell_index.dart';

extension CellIndexExtension on int {
  bool get isErrorCellIndex =>
      this < CellIndex.minIndex || this > CellIndex.maxIndex;
  bool get isWallIndex =>
      (this >= CellIndex.minIndex && this <= 16) ||
      (this >= 272 && this <= CellIndex.maxIndex) ||
      (this % 17 == 0) ||
      ((this + 1) % 17 == 0);
  bool get isTopLeftCellIndex => this == CellIndex.topLeftIndex;
  bool get isTopRightCellIndex => this == CellIndex.topRightIndex;
  bool get isBottomLeftCellIndex => this == CellIndex.bottomLeftIndex;
  bool get isBottomRightCellIndex => this == CellIndex.bottomRightIndex;
  bool get isTopSideCellIndex =>
      this > CellIndex.topLeftIndex && this < CellIndex.topRightIndex;
  bool get isBottomSideCellIndex =>
      this > CellIndex.bottomLeftIndex && this < CellIndex.bottomRightIndex;
  bool get isLeftSideCellIndex => (this - 1) % 17 == 0;
  bool get isRightSideCellIndex => (this + 2) % 17 == 0;
  bool get isInsideWithDotCellIndex =>
      this == 72 || this == 80 || this == 208 || this == 216;
}
