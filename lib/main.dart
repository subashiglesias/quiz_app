import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quizapp/question.dart';

void main() => runApp(QuizApp());

class QuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: QuizPage(),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Widget> scoreKeeper = [];

  static List<String> questions = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.'
  ];

  static List<bool> answers = [false, true, true];

  int questionNumber = 0;

  List<Question> questionBank = [
    Question(question: questions[0], answer: answers[0]),
    Question(question: questions[1], answer: answers[1]),
    Question(question: questions[2], answer: answers[2]),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                questionBank[questionNumber].questionText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.green,
              child: Text(
                'True',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if (true == questionBank[questionNumber].questionAnswer) {
                  setState(() {
                    scoreKeeper.add(correctIcon());
                  });
                } else {
                  setState(() {
                    scoreKeeper.add(wrongIcon());
                  });
                }
                if (questionNumber < 2) questionNumber++;
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                if (false == questionBank[questionNumber].questionAnswer) {
                  setState(() {
                    scoreKeeper.add(correctIcon());
                  });
                } else {
                  setState(() {
                    scoreKeeper.add(wrongIcon());
                  });
                }
                if (questionNumber < 2) questionNumber++;
              },
            ),
          ),
        ),
        Row(
          children: scoreKeeper,
        )
      ],
    );
  }
}

Icon correctIcon() {
  return Icon(
    Icons.check,
    color: Colors.green,
  );
}

Icon wrongIcon() {
  return Icon(
    Icons.close,
    color: Colors.red,
  );
}
