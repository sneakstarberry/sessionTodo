import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final AnimationController animationController;

  ChatMessage({this.text, this.animationController});
  @override
  Widget build(BuildContext context) {
    return SizeTransition(
      sizeFactor:
          CurvedAnimation(parent: animationController, curve: Curves.easeOut),
      axisAlignment: -1.0,
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 10.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: 16.0),
                child: CircleAvatar(child: Text("Y")),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Your name", style: Theme.of(context).textTheme.subtitle1),
                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    child: Text(this.text),
                  ),
                ],
              ),
            ],
          ),
        )
      ),
    );
  }
}
