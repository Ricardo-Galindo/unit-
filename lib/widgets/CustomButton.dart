import 'package:flutter/cupertino.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
      {required this.margin,
      required this.onTap,
      required this.text,
      required this.textColor,
      required this.buttonColor});

  final double margin;
  final void Function()? onTap;
  final String text;
  final Color textColor;
  final Color buttonColor;

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
          child: Text(
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
