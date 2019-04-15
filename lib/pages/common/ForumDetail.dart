import 'package:flutter/material.dart';
import '../common/LabelSubLabelValue.dart';
import '../../styles/TextsStyle.dart';
import '../../models/Forum.dart';


class ForumDetail extends StatelessWidget {

  final Forum forum;

  ForumDetail({this.forum});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyCustomClipper(),
      child: Container(
        height: 160.0,
        color: Colors.white,
        padding: EdgeInsets.only(left: 20.0, right: 10.0, top: 25.0, bottom: 12.0),
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.topRight,
              child: Column(
                children: <Widget>[
                  Container(
                    decoration: new BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.4),
                        width: 2.0
                      )
                    ),
                    height: 40.0,
                    width: 40.0,
                    child: Center(
                      child: Text(forum.rank, style: rankStyle,),
                    ),
                  ),
                  Text('New', style: labelTextStyle,)
                ],
              ),
            ),
            SizedBox(
              height: 25,

            ),
            Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                LabelSubLabelValue( 
                  label: "Topics",
                  value: forum.topics.length.toString(),
                  labelStyle: labelTextStyle,
                  valueStyle: valueTextStyle,
                ),
                LabelSubLabelValue(
                  label: "Threads",
                  value: forum.threads,
                  labelStyle: labelTextStyle,
                  valueStyle: valueTextStyle,
                ),
                LabelSubLabelValue(
                  label: "Subs",
                  value: forum.subs,
                  labelStyle: labelTextStyle,
                  valueStyle: valueTextStyle,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


class MyCustomClipper extends CustomClipper<Path> {
  final double distanceFromWall = 12, controlPointDistanceFromWall = 2;

  @override
  Path getClip(Size size) {
    final double height = size.height;
    final double halfHeight = size.height * 0.5;
    final double width = size.width;

    Path clippedPath= new Path();
    clippedPath.moveTo(0, halfHeight);
    clippedPath.lineTo(0, height - distanceFromWall);
    clippedPath.quadraticBezierTo(0 + controlPointDistanceFromWall, 
      height - controlPointDistanceFromWall, 
      0 + distanceFromWall, 
      height);
    clippedPath.lineTo(width, height);
    clippedPath.lineTo(width, 30.0);
    clippedPath.quadraticBezierTo(width - 5, 5.0, width - 35.0, 15.0);
    clippedPath.close();
    return clippedPath;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}