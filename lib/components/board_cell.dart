import 'package:flutter/material.dart';

class BoardCell extends StatelessWidget {
  const BoardCell({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(index);
      },
      child: Container(
        margin: const EdgeInsets.all(1.0),
        height: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: const Color(0xfffdfcd1),
          borderRadius: BorderRadius.circular(1.0),
        ),
        child: FittedBox(
          child: Text(
            index.toString(),
            style: const TextStyle(
              fontSize: 12.0,
            ),
          ),
        ),
      ),
    );
  }
}
