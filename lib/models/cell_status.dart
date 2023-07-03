enum CellStatus {
  black,
  white,
  empty,
  wall,
}

extension CellStatusExtension on CellStatus {
  bool get isBlack => this == CellStatus.black;
  bool get isWhite => this == CellStatus.white;
  bool get isEmpty => this == CellStatus.empty;
  bool get isWall => this == CellStatus.wall;
  bool get isNotEmpty => !isEmpty;
  bool get isNotWall => !isWall;
}
