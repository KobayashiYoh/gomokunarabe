import 'package:flutter/material.dart';
import 'package:gomokunarabe/views/board_view.dart';

class PlayingPage extends StatelessWidget {
  const PlayingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: BoardView(),
        ),
      ),
    );
  }
}
