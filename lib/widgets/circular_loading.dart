import 'package:flutter/material.dart';

class CircularLoading extends StatelessWidget {
  CircularLoading({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(
        strokeWidth: 2.0,
        valueColor: AlwaysStoppedAnimation(color),
      ),
    );
  }
}
