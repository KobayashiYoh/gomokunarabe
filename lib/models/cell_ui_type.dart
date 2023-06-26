import 'package:gomokunarabe/constants/image_paths.dart';

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
