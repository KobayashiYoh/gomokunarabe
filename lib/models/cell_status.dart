enum CellStatus {
  black,
  white,
  empty,
}

extension CellStatusExtension on CellStatus {
  bool get isBlack => this == CellStatus.black;
  bool get isWhite => this == CellStatus.white;
  bool get isEmpty => this == CellStatus.empty;
  bool get isNotEmpty => !isEmpty;

  String get text {
    switch (this) {
      case CellStatus.black:
        return '●';
      case CellStatus.white:
        return '○';
      case CellStatus.empty:
        return '';
    }
  }
}
