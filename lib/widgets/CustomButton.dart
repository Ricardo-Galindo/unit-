import 'package:flutter/material.dart';
import 'package:unit_mais/widgets/circular_loading.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
      {required this.margin,
      required this.onTap,
      required this.text,
      required this.textColor,
      required this.buttonColor,
      required this.isLoading});

  final double margin;
  final void Function()? onTap;
  final String text;
  final Color textColor;
  final Color buttonColor;
  final bool isLoading;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        height: 54,
        margin: EdgeInsets.only(top: widget.margin),
        decoration: BoxDecoration(
          color: widget.buttonColor,
          borderRadius: BorderRadius.all(
            Radius.circular(5),
          ),
        ),
        child: Center(
          child: widget.isLoading
              ? CircularLoading(color: Colors.white)
              : Text(
                  widget.text,
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 18,
                      color: widget.textColor,
                      fontWeight: FontWeight.bold),
                ),
        ),
      ),
    );
  }
}
