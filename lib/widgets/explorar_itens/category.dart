import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategoryWidget extends StatelessWidget {
  final String name;
  final String image;
  final Color color;

  CategoryWidget({this.name, this.image, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          RawMaterialButton(
            onPressed: null,
            fillColor: color,
            shape: CircleBorder(),
            child: SvgPicture.asset(
              image,
              height: 24,
              width: 24,
              color: Colors.white,
            ),
          ),
          Text(
            '$name',
            style: TextStyle(
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
