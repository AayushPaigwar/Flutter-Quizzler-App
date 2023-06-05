import 'package:flutter/material.dart';
import 'quiz_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Quizbrain quizBrain = Quizbrain();

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

//All Functions
List<Icon> scoreKeeper = [];

void checkanswer(bool userPickedAnswer) {
  bool answers = quizBrain.getCorrectAnswer();

  if (userPickedAnswer == answers) {
    scoreKeeper.add(const Icon(
      Icons.check,
      color: Colors.green,
      size: 30,
    ));
  } else {
    scoreKeeper.add(
      const Icon(
        Icons.close,
        color: Colors.red,
        size: 30,
      ),
    );
  }
}

class _QuizpageState extends State<Quizpage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 5,
          child: Center(
            child: Text(
              quizBrain.getQuestionText(),
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
                if (quizBrain.isFinished() == true) {
                  Alert(
                    context: context,
                    title: 'Finished!',
                    desc: 'You\'ve reached the end of the quiz.',
                  ).show();

                  quizBrain.reset();

                  scoreKeeper = [];
                } else {
                  checkanswer(false);
                }

                setState(() {
                  quizBrain.nextQuestion();
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
                  //Dialog Button
                  if (quizBrain.isFinished() == true) {
                    Alert(
                      context: context,
                      title: 'Finished!',
                      desc: 'You\'ve reached the end of the quiz.',
                    ).show();

                    quizBrain.reset();

                    scoreKeeper = [];
                  } else {
                    checkanswer(true);
                  }
                  //for going to the next question
                  quizBrain.nextQuestion();
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
