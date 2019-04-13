import 'package:flutter/material.dart';
import 'package:games_store/styles/ColorsStyle.dart';
import 'package:games_store/styles/TextsStyle.dart';


class ForumNameButton extends StatelessWidget {

  final String name;

  ForumNameButton({this.name});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: primaryColor,
      shape: CustomShapeBorder(),
      elevation: 10.0,
      child: Padding(
        padding: EdgeInsets.only(top: 24.0, left: 30.0, right: 16.0, bottom: 10.0),
        
        child: Text(
          name, 
          style: forumNameStyle,
        ),
      ),
    );
  }
}

class CustomShapeBorder extends ShapeBorder {

  final double distanceFromWall = 12, controlPointDistanceFromWall = 2;
  
  _getClip(Size size) {
    Path clippedPath = Path();
    clippedPath.moveTo(0 + distanceFromWall, 0);
    clippedPath.quadraticBezierTo(0 + controlPointDistanceFromWall,
      0 + controlPointDistanceFromWall, 0, 0 + distanceFromWall);
    clippedPath.lineTo(0, size.height - distanceFromWall);
    clippedPath.quadraticBezierTo(
      0 + controlPointDistanceFromWall,
      size.height - controlPointDistanceFromWall,
      0 + distanceFromWall, 
      size.height);
    clippedPath.lineTo(size.width - distanceFromWall, size.height);
    clippedPath.quadraticBezierTo(
      size.width - controlPointDistanceFromWall,
      size.height - controlPointDistanceFromWall,
      size.width, 
      size.height - distanceFromWall);
    clippedPath.lineTo(size.width, size.height * 0.6);
    clippedPath.quadraticBezierTo(
      size.width - 1,
      size.height * 0.6 - distanceFromWall,
      size.width - distanceFromWall, 
      size.height * 0.6 - distanceFromWall - 3);
    clippedPath.lineTo(0 + distanceFromWall + 6, 0);
    clippedPath.close();
    return clippedPath;
  }

  @override
  // TODO: implement dimensions
  EdgeInsetsGeometry get dimensions => null;

  @override
  Path getInnerPath(Rect rect, {TextDirection textDirection}) {
    // TODO: implement getInnerPath
    return null;
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
    // TODO: implement getOuterPath
    return _getClip(Size(130.0, 60.0));
  }

  @override
  void paint(Canvas canvas, Rect rect, {TextDirection textDirection}) {
    // TODO: implement paint
  }

  @override
  ShapeBorder scale(double t) {
    // TODO: implement scale
    return null;
  }

}