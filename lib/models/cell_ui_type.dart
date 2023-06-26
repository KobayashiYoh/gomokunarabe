import 'package:gomokunarabe/constants/cell_index.dart';
import 'package:gomokunarabe/constants/image_paths.dart';
import 'package:gomokunarabe/extensions/cell_index_extension.dart';

enum CellUIType {
  topLeft,
  topSide,
  topRight,
  leftSide,
  inside,
  rightSide,
  bottomLeft,
  bottomSide,
  bottomRight,
  insideWithDot,
  none,
}

extension CellUITypeExtension on CellUIType {
  String get backgroundImagePath {
    switch (this) {
      case (CellUIType.topLeft):
        return ImagePaths.cellTopLeft;
      case (CellUIType.topSide):
        return ImagePaths.cellTopSide;
      case (CellUIType.topRight):
        return ImagePaths.cellTopRight;
      case (CellUIType.leftSide):
        return ImagePaths.cellLeftSide;
      case (CellUIType.inside):
        return ImagePaths.cellInside;
      case (CellUIType.rightSide):
        return ImagePaths.cellRightSide;
      case (CellUIType.bottomLeft):
        return ImagePaths.cellBottomLeft;
      case (CellUIType.bottomSide):
        return ImagePaths.cellBottomSide;
      case (CellUIType.bottomRight):
        return ImagePaths.cellBottomRight;
      case (CellUIType.insideWithDot):
        return ImagePaths.cellInsideWithDot;
      case (CellUIType.none):
        return '';
    }
  }
}

CellUIType indexToCellUIType(int index) {
  if (index.isErrorCellIndex) {
    throw ArgumentError(
      'Invalid index value. Please provide a value between ${CellIndex.minIndex} and ${CellIndex.maxIndex}.',
    );
  } else if (index.isWallIndex) {
    return CellUIType.none;
  } else if (index.isTopLeftCellIndex) {
    return CellUIType.topLeft;
  } else if (index.isTopRightCellIndex) {
    return CellUIType.topRight;
  } else if (index.isBottomLeftCellIndex) {
    return CellUIType.bottomLeft;
  } else if (index.isBottomRightCellIndex) {
    return CellUIType.bottomRight;
  } else if (index.isTopSideCellIndex) {
    return CellUIType.topSide;
  } else if (index.isBottomSideCellIndex) {
    return CellUIType.bottomSide;
  } else if (index.isLeftSideCellIndex) {
    return CellUIType.leftSide;
  } else if (index.isRightSideCellIndex) {
    return CellUIType.rightSide;
  } else if (index.isInsideWithDotCellIndex) {
    return CellUIType.insideWithDot;
  } else {
    return CellUIType.inside;
  }
}
