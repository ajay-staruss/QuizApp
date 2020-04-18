import 'package:flutter/material.dart';

import './question.dart';
import './answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var questionIndex = 0;
  int totalScore = 0;

  void restartQuiz() {
    setState(() {
      questionIndex = 0;
      totalScore = 0;
    });
  }

  String get resultPhase {
    String resultText;
    if (totalScore <= 9) {
      resultText = 'You are awesome';
    } else if (totalScore <= 12) {
      resultText = 'Pretty likable';
    } else if (totalScore <= 16) {
      resultText = 'You are Strange';
    } else {
      resultText = 'You are so bad';
    }
    return resultText;
  }

  void answerQuestion(int score) {
    totalScore += score;

    setState(() {
      questionIndex = questionIndex + 1;
    });

    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'What\'s your favourite color',
        'answer': [
          {'text': 'Red', 'score': 5},
          {'text': 'Blue', 'score': 6},
          {'text': 'Green', 'score': 3},
          {'text': 'Yellow', 'score': 4}
        ]
      },
      {
        'questionText': 'What\'s your favourite animal',
        'answer': [
          {'text': 'Rabbit', 'score': 5},
          {'text': 'Lion', 'score': 6},
          {'text': 'Dog', 'score': 3},
          {'text': 'Cat', 'score': 4}
        ]
      },
      {
        'questionText': 'What\'s your favourite game',
        'answer': [
          {'text': 'PUBG', 'score': 5},
          {'text': 'COD', 'score': 6},
          {'text': 'CSGO', 'score': 3},
          {'text': 'DOTA', 'score': 4}
        ]
      },
    ];

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Name'),
      ),
      body: questionIndex < questions.length
          ? Column(
              children: <Widget>[
                Question(
                  questions[questionIndex]['questionText'],
                ),
                ...(questions[questionIndex]['answer']
                        as List<Map<String, Object>>)
                    .map((ans) {
                  return Answer(
                      () => answerQuestion(ans['score']), ans['text']);
                }).toList()
              ],
            )
          : Center(
              child: Column(
                children: <Widget>[
                  Text(
                    resultPhase,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  FlatButton(
                    child: Text('Reset Quiz'),
                    onPressed: restartQuiz,
                    textColor: Colors.blue,
                  )
                ],
              ),
            ),
    ));
  }
}
