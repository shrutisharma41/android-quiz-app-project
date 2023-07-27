import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);

    var _questions;
    if (_questionIndex < _questions.length) {
      print('we have more questions!');
    } else {
      print('no more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    final _questions = const [
      {
        'questionText': 'what\'s your favourite season?',
        'answers': [
          {'text': 'summer', 'score': 10},
          {'text': 'winter', 'score': 8},
          {'text': 'autumn', 'score': 5},
          {'text': 'spring', 'score': 3},
        ],
      },
      {
        'questionText': 'why you like it?',
        'answers': [
          {'text': 'cold weather', 'score': 15},
          {'text': 'snowfall', 'score': 6},
          {'text': 'travel', 'score': 2},
          {'text': 'all', 'score': 20},
        ],
      },
      {
        'questionText': 'what\'s your favourite place to visit that time?',
        'answers': [
          {'text': 'kashmir', 'score': 1},
          {'text': 'shimla', 'score': 6},
          {'text': 'manali', 'score': 4},
          {'text': 'leh', 'score': 1},
        ],
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
