import 'package:flutter/material.dart';
import '../../styles/TextsStyle.dart';

class TabText extends StatelessWidget {

  final bool isSelected;
  final String text;
  final Function onTap;

  TabText({this.text, this.isSelected, this.onTap});

  @override
  Widget build(BuildContext context) {
    return  Transform.rotate(
      angle: -1.58,
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 50,
          alignment: Alignment.center,
          child: AnimatedDefaultTextStyle(
            child: Text(
              text,
            ),
            duration: const Duration(milliseconds: 200),
            style: isSelected ? selectedTabStyle : defaultTabStyle 
          ),
        ),
      ),
    );
  }
}

class HorizontalTabLayout extends StatefulWidget {
  @override
  _HorizontalTabLayoutState createState() => _HorizontalTabLayoutState();
}

class _HorizontalTabLayoutState extends State<HorizontalTabLayout> {

  int selectedIdx = 2;
  _onTap(int idx)
  {
    setState(() {
      selectedIdx = idx;
    });
  }

  _buildTapBar(){
    return Positioned(
      left: -30,
      top: 0,
      bottom: 0, 
      width: 120.0, 
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          TabText(
            text: "Media",
            isSelected: selectedIdx == 0,
            onTap: (){
              _onTap(0);
            },
          ),
          TabText(
            text: "Streamers",
            isSelected: selectedIdx == 1,
            onTap: (){
              _onTap(1);
            }
          ),
          TabText(
            text: "Forum",
            isSelected: selectedIdx == 2,
            onTap: (){
              _onTap(2);
            }
          ),
        ],
      ),
    );
  }

  _buildListCards(){
    return Padding(
      padding: EdgeInsets.only(left: 60.0),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          Container(
            width: 280.0,
            height: 300.0,
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: Colors.blue,
            ),
          ),
          Container(
            width: 280.0,
            height: 300.0,
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.6,
      child: Stack(        
        children: <Widget>[
          _buildTapBar(),
          _buildListCards()
        ],
      ),
    )
    ;
  }
}