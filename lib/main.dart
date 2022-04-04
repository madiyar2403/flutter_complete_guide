import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'What\'s your favorite color?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'White', 'score': 1},
        {'text': 'Green', 'score': 2}
        ],
    },
    {
      'questionText': 'What\'s your favorite animal?',
      'answers': [
        {'text': 'Rabbit', 'score': 6},
        {'text': 'Giraffe', 'score': 3},
        {'text': 'Bear', 'score': 8},
        {'text': 'Elephant', 'score': 10}
        ],
    },
    {
      'questionText': 'Who\'s your favorite instructor?',
      'answers': [
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1},
        {'text': 'Max', 'score': 1}
        ],
    },
  ];
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
      _questionIndex += 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
            answerQuestion: _answerQuestion,
            questionIndex: _questionIndex,
            questions: _questions
            )
            : Result(_totalScore, _resetQuiz)
      ),
    );
  }
}
