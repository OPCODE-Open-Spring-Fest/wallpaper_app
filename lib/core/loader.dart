import 'package:flutter/material.dart';
import 'package:load_it/load_it.dart';

class Loader extends StatelessWidget {
  const Loader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: RotatingSquareIndicator(color: Colors.pinkAccent));
  }
}
