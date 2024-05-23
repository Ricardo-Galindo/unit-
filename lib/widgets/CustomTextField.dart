import 'package:flutter/material.dart';
import 'package:unit_mais/constants.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {required this.hintText, required this.onSubmitted, required this.icon});

  final String hintText;
  final Function(String?) onSubmitted;
  final IconData icon;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      padding: EdgeInsets.symmetric(horizontal: 18),
      decoration: BoxDecoration(
        color: Color(0xFFF1F1F1),
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: TextField(
        onSubmitted: widget.onSubmitted,
        decoration: InputDecoration(
            suffixIcon: Icon(
              widget.icon,
              color: kPrimaryColor,
            ),
            hintText: widget.hintText,
            hintStyle: TextStyle(
              color: Color(0xFF989898),
              fontFamily: 'Roboto',
              fontSize: 12,
            ),
            border: InputBorder.none),
      ),
    );
  }
}
