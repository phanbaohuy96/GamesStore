import 'package:flutter/material.dart';
import 'package:games_store/pages/common/LabelSubLabelValue.dart';
import 'package:games_store/styles/TextsStyle.dart';
import '../styles/ColorsStyle.dart';
import '../models/Forum.dart';
import 'common/AppBackground.dart';

class DetailsPage extends StatefulWidget {

  final Forum forum;

  DetailsPage(this.forum);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> with SingleTickerProviderStateMixin{

  AnimationController _controller;
  Animation<double> _animationScale, _animationFade;
  Animation<Offset> _animationSlide;

  @override
  void initState(){
    super.initState();    
    _controller = new AnimationController(duration: Duration(milliseconds: 500), vsync: this);
    _animationScale = new Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _animationFade = new Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _animationSlide = new Tween<Offset>(begin: Offset(0.0, 2.0), end: Offset(0, 0)).animate(_controller);
  }

  @override
  void dispose()
  {
    _controller.dispose();
    super.dispose();
  }

  _playAnimation()
  {
    _controller.reset();
    _controller.forward();
  }


  @override
  Widget build(BuildContext context) {
    Size contextSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          AppBackground.detail(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 30,),
              Padding(
                padding: EdgeInsets.only(left: 5),                
                child: IconButton(                  
                  icon: Icon(
                    Icons.arrow_back, 
                    color: Colors.white,
                    size: 27.0,
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  color: Colors.transparent,
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: EdgeInsets.only(left: 16, bottom: 15),
                child: FutureBuilder(
                  future: _playAnimation(),
                  builder: (context, snapshot){
                    return FadeTransition(
                      opacity: _animationFade,
                      child: SizedBox(
                        width: contextSize.width * 0.67,
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            LabelSubLabelValue( 
                              label: "Topics",
                              value: widget.forum.topics.length.toString(),
                              labelStyle: whiteLabelTextStyle,
                              valueStyle: whiteValueTextStyle,
                            ),
                            LabelSubLabelValue(
                              label: "Threads",
                              value: widget.forum.threads,
                              labelStyle: whiteLabelTextStyle,
                              valueStyle: whiteValueTextStyle,
                            ),
                            LabelSubLabelValue(
                              label: "Subs",
                              value: widget.forum.subs,
                              labelStyle: whiteLabelTextStyle,
                              valueStyle: whiteValueTextStyle,
                            )
                          ],
                        ),
                      ),
                    );
                  }
                ),
              ),
              SizedBox(
                height: contextSize.height * 0.6,
                child: Hero(
                  tag: widget.forum.title,
                  child: ClipRRect(
                    child: Image.asset(widget.forum.imagePath, fit: BoxFit.fitWidth, width: double.infinity,),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
                  ),
                ),
              )
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SlideTransition(
              position: _animationSlide,
              child: ClipRRect(                
                borderRadius: BorderRadius.only(topLeft: Radius.circular(60)),
                child: Container(                  
                  width: contextSize.width,
                  height: contextSize.height * 0.35,
                  color: Colors.white,
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10, bottom: 10),
                        padding: EdgeInsets.only(bottom: 3),
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: primaryColor
                        ),
                        height: 35,
                        width: 100,
                        child: Text("Topic", style: forumNameStyle,),
                      ),
                      Flexible(
                        child: ListView(
                          padding: EdgeInsets.only(top: 0),
                          children: widget.forum.topics.map((item){
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8.0, left: 16.0),
                              child: TopicItem(topic: item,)
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(    
            bottom: 225,
            right: 15,        
            child: ScaleTransition(
              scale: _animationScale,
              child: Material(
                elevation: 10,      
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(widget.forum.rank, style: rankBigStyle,),
                ),
                color: Colors.white,
                shape: CircleBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopicItem extends StatelessWidget {

  final Topic topic;

  const TopicItem({this.topic});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[        
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Flexible(child: Text(topic.question, style: topicQuestionStyle,)),            
            Padding(
              padding: EdgeInsets.only(left: 5.0,right: 15.0),
              child: Container(
                padding: EdgeInsets.only(left: 10.0, right: 10.0),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(8.0)
                ),
                child: Text(topic.answerCount, style: topicCountStyle,)
              ),
            ),
          ],
        ),
        Text(topic.recentAnswer, style: topicAnswerStyle, maxLines: 2, overflow: TextOverflow.ellipsis,)
      ],
    );
  }
}