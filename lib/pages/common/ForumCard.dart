import 'package:flutter/material.dart';
import '../DetailsPage.dart';
import '../../models/Forum.dart';
import 'ForumNameButton.dart';
import 'ForumDetail.dart';

class ForumCard extends StatelessWidget {

  final Forum forum;

  ForumCard({this.forum});

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: forum.title,
      child: SizedBox(
        width: 260.0,
        child: Card(
          elevation: 20,
          margin: EdgeInsets.symmetric(horizontal: 25.0 , vertical: 70.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: Stack(
              children: <Widget>[
                Image.asset(
                  forum.imagePath, 
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: ForumDetail(forum: forum,)
                ),
                Positioned(
                  left: 0,
                  bottom: 65.0,
                  child: ForumNameButton(name: forum.title,)
                ),
                GestureDetector(
                  onTapUp: (detail){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(forum)));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}