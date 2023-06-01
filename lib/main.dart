import 'package:flutter/material.dart';
import 'dart:math';
import 'question.dart';

void main() => runApp(const Quizzler());

class Quizzler extends StatelessWidget {
  const Quizzler({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black87,
        body: SafeArea(
          child: Expanded(
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: Quizpage(),
            ),
          ),
        ),
      ),
    );
  }
}

class Quizpage extends StatefulWidget {
  const Quizpage({super.key});

  @override
  State<Quizpage> createState() => _QuizpageState();
}

List<Icon> scoreKeeper = [];
// List<String> questions = [
//   'Mumbai is Capital of Maharashtra',
//   'Nagpur is Capital of Andhra Pradesh',
//   'Nagpur is Capital of Karnataka',
//   'Nagpur is Capital of Bihar',
// ];

// List<bool> correctAnswers = [
//   true,
//   false,
//   false,
//   false,
// ];

List<Question> questionbank = [
  Question(q: 'Mumbai is Capital of Maharashtra', a: true),
  Question(q: 'Nagpur is Capital of Andhra Pradesh', a: false),
  Question(q: 'Nagpur is Capital of Karnataka', a: false),
  Question(q: 'Nagpur is Capital of Bihar', a: false),
];
int questionNumber = 0;

class _QuizpageState extends State<Quizpage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              questionbank[questionNumber].questionText,
              style: const TextStyle(color: Colors.grey, fontSize: 30),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.red)),
              onPressed: () {
                //What will happen of pressed

                bool answers = questionbank[questionNumber].questionAnswer;

                if (answers == false) {
                  print('The asnwers is correct');
                } else {
                  print('The answer is wronng');
                }
                setState(() {
                  questionNumber++;

                  //questionNumber= questionNumber + 1;
                  scoreKeeper.add(const Icon(
                    Icons.close,
                    color: Colors.red,
                    size: 40,
                  ));
                });
              },
              child: const Center(
                child: Text(
                  "FALSE",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
          height: 20,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextButton(
              style: const ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.green)),
              onPressed: () {
                //checking answers
                bool answers = questionbank[questionNumber].questionAnswer;
                if (answers == true) {
                  print('The asnwers is correct');
                } else {
                  print('The answer is wrong');
                }
                setState(() {
                  //for going to the next question
                  questionNumber++;
                  //questionNumber =questionNumber +1;
                  scoreKeeper.add(
                    const Icon(
                      Icons.check,
                      color: Colors.green,
                      size: 40,
                    ),
                  );
                });
              },
              child: const Center(
                child: Text(
                  "TRUE",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
          height: 20,
        ),
        Row(children: scoreKeeper)
      ],
    );
  }
}
