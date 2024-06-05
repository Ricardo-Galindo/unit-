import 'package:flutter/material.dart';
import 'package:unit_mais/constants.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField(
      {required this.hintText,
      required this.onSaved,
      required this.icon,
      required this.validate,
      required this.isPasswordField});

  final String hintText;
  final Function(String?) onSaved;
  final IconData icon;
  final String? Function(String?)? validate;
  final bool isPasswordField;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color(0xFFF1F1F1),
      ),
      child: TextFormField(
        onSaved: widget.onSaved,
        validator: widget.validate,
        obscureText: widget.isPasswordField,
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
          contentPadding: const EdgeInsets.symmetric(horizontal: 18),
          isDense: true,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none),
        ),
      ),
    );
  }
}
