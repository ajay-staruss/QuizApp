import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function selectHandler;
  final String answer;
  Answer(this.selectHandler,this.answer);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: double.infinity,
      child: RaisedButton(
        child: Text(answer),
        color: Colors.blue,
        onPressed: selectHandler,
      ),
    );
  }
}
