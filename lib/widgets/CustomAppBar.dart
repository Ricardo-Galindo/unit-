import 'package:flutter/material.dart';
import 'package:unit_mais/constants.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({required this.onTap, required this.shouldShow});

  final void Function()? onTap;
  final bool shouldShow;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(color: kPrimaryColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              shouldShow
                  ? GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 23),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : Container(),
              Container(
                child: Text(
                  "LOCAIS",
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: onTap,
            child: Icon(
              Icons.person,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
