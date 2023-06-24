import 'package:gomokunarabe/constants/image_paths.dart';

enum CellType {
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
}

extension CellTypeExtension on CellType {
  String get imagePath {
    switch (this) {
      case (CellType.topLeft):
        return ImagePaths.cellTopLeft;
      case (CellType.topSide):
        return ImagePaths.cellTopSide;
      case (CellType.topRight):
        return ImagePaths.cellTopRight;
      case (CellType.leftSide):
        return ImagePaths.cellLeftSide;
      case (CellType.inside):
        return ImagePaths.cellInside;
      case (CellType.rightSide):
        return ImagePaths.cellRightSide;
      case (CellType.bottomLeft):
        return ImagePaths.cellBottomLeft;
      case (CellType.bottomSide):
        return ImagePaths.cellBottomSide;
      case (CellType.bottomRight):
        return ImagePaths.cellBottomRight;
      case (CellType.insideWithDot):
        return ImagePaths.cellInside;
    }
  }
}
