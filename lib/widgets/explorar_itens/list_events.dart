import 'package:flutter/material.dart';

class ListEventsWidget extends StatelessWidget {
  final String name;
  final String image;

  ListEventsWidget({this.name, this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145,
      width: 120,
      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 7),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: SizedBox(),
          ),
          Text(
            name,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
