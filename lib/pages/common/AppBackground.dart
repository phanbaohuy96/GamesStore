import 'package:flutter/material.dart';
import '../../styles/ColorsStyle.dart';

class AppBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraint){
        final height = constraint.maxHeight;
        final width = constraint.maxWidth;

        return Stack(
          children: <Widget>[
            Container(
              color: backgroundColor,
            ),
            Positioned(
              left: -(height/2 - width/2),
              bottom: height * 0.25,
              child: Container(
                height: height,
                width: height,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: firstCircleColor
                  ,
                )
              ),
            ),
            Positioned(
              left: width * 0.15,
              top: -width * 0.5,
              child: Container(
                  height: width * 1.5,
                  width: width * 1.5,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: secondCircleColor
                  )
              )
            ),
            Positioned(
                right: - width * 0.5,
                top: -width * 0.5,
                child: Container(
                    height: width,
                    width: width,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: thirdCircleColor
                    )
                )
            )
          ]
        );
      },
    );
  }
}
