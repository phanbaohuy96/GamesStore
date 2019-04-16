import 'package:flutter/material.dart';
import 'package:games_store/pages/common/ForumCard.dart';
import '../../styles/TextsStyle.dart';
import '../../models/Forum.dart';

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

class _HorizontalTabLayoutState extends State<HorizontalTabLayout> with SingleTickerProviderStateMixin{

  AnimationController _controller;
  Animation<double> _animationScale, _animationRotation;
  Animation<Offset> _animationSlide;
  ScrollController _scrollController;

  @override
  void initState(){
    super.initState();    
    _scrollController = new ScrollController();
    _controller = new AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _animationScale = new Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _animationRotation = new Tween<double>(begin: 0.5, end: 0.0).animate(_controller);
    _animationSlide = new Tween<Offset>(begin: Offset(0.5, -0.5), end: Offset(0, 0)).animate(_controller);
  }

  @override
  void dispose()
  {
    _controller.dispose();
    super.dispose();
  }

  int selectedIdx = 2;
  _onTap(int idx)
  {
    if(selectedIdx != idx)
      setState(() {
        _scrollController.animateTo(0, duration: Duration(microseconds: 50), curve: Curves.bounceInOut);
        selectedIdx = idx;
      });
  }

  _playWitchTabAnimation(){
    _controller.reset();
    _controller.forward();
  }

  _buildTabBar(){
    return Positioned(
      left: -30,
      top: 0,
      bottom: 0, 
      width: 120.0, 
      child: Padding(
        padding: EdgeInsets.only(top: 40.0, bottom: 40.0),
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
      ),
    );
  }

  _buildListCards(){
    return Padding(
      padding: EdgeInsets.only(left: 60.0),
      child: FutureBuilder(
        future: _playWitchTabAnimation(),
        builder: (context, snapshot){
          return ListView(
            controller: _scrollController,
            shrinkWrap: false,
            scrollDirection: Axis.horizontal,
            children: _getListItems(selectedIdx)
          );
        },
      ),
    );
  }

  _getListItems(int idx)  {
    return [
      [
        ScaleTransition(scale: _animationScale, child: ForumCard(forum: pubg,)),  
        ScaleTransition(scale: _animationScale, child: ForumCard(forum: fortnite,))
      ],
      [  
        SlideTransition(position: _animationSlide, child:ForumCard(forum: fortnite,)),
        SlideTransition(position: _animationSlide, child:ForumCard(forum: pubg,))
      ],
      [
        ScaleTransition(scale: _animationScale, child: RotationTransition(turns: _animationRotation, child:ForumCard(forum: pubg,))),  
        ScaleTransition(scale: _animationScale, child: RotationTransition(turns: _animationRotation, child:ForumCard(forum: fortnite,)))
      ]
    ][idx];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.73,
      child: Stack(        
        children: <Widget>[
          _buildTabBar(),
          _buildListCards()
        ],
      ),
    )
    ;
  }
}