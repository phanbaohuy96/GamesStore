import 'package:flutter/material.dart';
import 'package:games_store/pages/common/AppBackground.dart';
import 'common/HorizontalTabLayout.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBackground(),
          Center(
            child: HorizontalTabLayout(),
          )

        ],

      ),
    );
  }
}
