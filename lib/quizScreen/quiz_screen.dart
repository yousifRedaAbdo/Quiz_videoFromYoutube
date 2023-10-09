import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);


  @override

  _QuizScreenState createState() => _QuizScreenState({});
}

class _QuizScreenState extends State<QuizScreen> {
  int _questionIndex = 0;
  int _numCorrect = 0;
  final userName;

  _QuizScreenState(this.userName);

  void _answerQuestion(int choiceIndex) {
    if (choiceIndex == questions[_questionIndex].correctIndex) {
      setState(() {
        _numCorrect++;
      });
    }
    setState(() {
      _questionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: const Text("Quiz")),
      ),
      body: Center(
        child: _questionIndex < questions.length
            ? Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
              Text(
                questions[_questionIndex].questionText,
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(height: 16),
              ...questions[_questionIndex].choices.asMap().entries.map((entry) =>
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ElevatedButton(
                      child: Text(entry.value),
                      onPressed: () => _answerQuestion(entry.key),
                    ),
                  ),
              ),
          ],
        ),
            )
            : Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Quiz complete!",
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 16),
            Text(
              "You got $_numCorrect out of ${questions.length} questions correct.",
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
class Question {
  String questionText;
  List<String> choices;
  int correctIndex;

  Question({required this.questionText, required this.choices, required this.correctIndex});
}

List<Question> questions = [
  Question(
    questionText: "What is the capital of Canada?",
    choices: ["Toronto", "Ottawa", "Vancouver", "Montreal"],
    correctIndex: 1,
  ),
  Question(
    questionText: "What is the largest planet in our solar system?",
    choices: ["Jupiter", "Saturn", "Mars", "Earth"],
    correctIndex: 0,
  ),
  Question(
    questionText: "كم يبلغ عدد لاعبي فريق هوكي الجليد؟",
    choices: ["11", "6", "14", "10"],
    correctIndex: 0,
  ),
  Question(
    questionText: "من أول من عرف لعبة الشطرنج؟",
    choices: ["الفرس", "الهنود الحمر", "الايطاليون", "الفرنسيون"],
    correctIndex: 3,
  ),
  Question(
    questionText: "من هو أول رسول أرسله الله تعالى إلى البشر؟",
    choices: ["ادم", "نوح", "عيسي", "موسي"],
    correctIndex: 0,
  ),
  Question(
    questionText: "What is the capital of France?",
    choices: ["Paris", "Rome", "Madrid", "Berlin"],
    correctIndex: 0,
  ),
  Question(
    questionText: "What is the largest country in the world?",
    choices: ["China", "Canada", "Russia", "United States"],
    correctIndex: 2,
  ),
  Question(
    questionText: "What is the highest mountain in the world?",
    choices: ["Mount Everest", "K2", "Kangchenjunga", "Lhotse"],
    correctIndex: 0,
  ),
  Question(
    questionText: "ما هي الصلاة التي لا ركوع ولا سجود فيها؟",
    choices: ["صلاة العيد", "صلاة الاستسقاء", "صلاة الجنازة", "صلاة الخوف"],
    correctIndex: 2,
  ),
  Question(
    questionText: "أين دفن صلاح الدين الأيوبي؟",
    choices: ["القاهرة", "دمشق", "تونس", "قطر"],
    correctIndex: 1,
  ),
];

