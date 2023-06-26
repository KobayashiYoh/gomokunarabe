import 'package:flutter/material.dart';
import 'package:gomokunarabe/models/cell_status.dart';

class Stone extends StatelessWidget {
  const Stone({Key? key, required this.status}) : super(key: key);
  final CellStatus status;

  @override
  Widget build(BuildContext context) {
    if (status.isEmpty || status.isWall) {
      return const SizedBox.shrink();
    }
    return Container(
      margin: const EdgeInsets.all(2.0),
      decoration: BoxDecoration(
        color: status.isBlack ? Colors.black : Colors.grey[50],
        shape: BoxShape.circle,
      ),
    );
  }
}
