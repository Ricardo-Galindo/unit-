import 'package:flutter/material.dart';

import '../constants.dart';

class CircularLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(
        strokeWidth: 2.0,
        valueColor: AlwaysStoppedAnimation(kPrimaryColor),
      ),
    );
  }
}
