import 'package:flutter/material.dart';
import 'common/AppBackground.dart';
import 'common/LabelSubLabelValue.dart';
import '../styles/ColorsStyle.dart';
import '../styles/TextsStyle.dart';
import 'common/HorizontalTabLayout.dart';

class LandingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBackground(),
          Column(
            children: <Widget>[
              SizedBox(height: 35,),
              Padding(
                padding: EdgeInsets.only(right: 20.0),  
                child: Align(
                  alignment: Alignment.topRight,
                  child: Material(
                    elevation: 10.0,
                    shape: CircleBorder(),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.apps, color: primaryColor,),
                    ),
                    color: Colors.white,                    
                  ),
                ),
              ),
              Align(
                alignment: Alignment(-0.6, 0),
                child: LabelSubLabelValue(
                  value: "Forum",
                  valueStyle: headingStyle,
                  label: "Kick off the conversation.",
                  labelStyle: labelTextStyle,
                ),
              ),
              HorizontalTabLayout(),
              Spacer(),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40)),
                    color: primaryColor
                  ),
                  child: new Text("New Topic", style: buttonStyle,)
                ),
              )
            ]
          ),
        ],        
      ),
    );
  }
}
