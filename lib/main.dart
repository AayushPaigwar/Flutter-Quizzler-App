import 'package:flutter/material.dart';
import 'dart:math';

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
List <String> questions =[
  'Nagpur is Capital of Maharashtra',
  'Nagpur is Capital of Andhra Pradesh',
  'Nagpur is Capital of Karnataka',
  'Nagpur is Capital of Bihar',
];

class _QuizpageState extends State<Quizpage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Expanded(
          flex: 5,
          child: Center(
            child: Text(
              questions[
                Random().nextInt(questions.length)  
              ],
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
                setState(() {
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
                setState(() {
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
