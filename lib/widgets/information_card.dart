import 'package:flutter/material.dart';
import 'package:unit_mais/constants.dart';

class InformationCard extends StatefulWidget {
  InformationCard(
      {required this.title,
      required this.commentary,
      required this.description,
      required this.onTap});

  final String title;
  final String commentary;
  final String description;
  final void Function()? onTap;

  @override
  State<InformationCard> createState() => _InformationCardState();
}

class _InformationCardState extends State<InformationCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: EdgeInsets.only(top: 20, left: 20, right: 20),
        height: 280,
        padding: EdgeInsets.only(left: 14, top: 16, right: 23, bottom: 32),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Container(
                        child: Text(
                          widget.title,
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    Icon(
                      Icons.favorite,
                      color: Colors.white,
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 12),
                  child: Text(
                    widget.commentary,
                    style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.white),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 10,
                  ),
                ),
              ],
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.only(top: 20),
                child: Text(
                  widget.description,
                  style: TextStyle(
                      fontFamily: 'Roboto',
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.white),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
