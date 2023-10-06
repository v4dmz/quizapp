import 'dart:io';
import 'dart:math';

void main() {
  final quiz = Quiz();

  print("Welcome to the Quiz App!");
  print("Press Enter to start...");
  stdin.readByteSync(); // Wait for a single character (Enter key)

  quiz.startQuiz();

  print("Thank you for playing the Quiz App!");
}

class Quiz {
  final List<Question> questions = [
    Question("What is the capital of France?", "Paris"),
    Question("What is the largest planet in our solar system?", "Jupiter"),
    // Add more questions here...
  ];

  void startQuiz() {
    final randList = generateRandomIndices(questions.length);
    int score = 0;

    for (var index in randList) {
      final question = questions[index];
      print(question.question);
      final userAnswer = promptForAnswer();
      if (userAnswer == question.answer) {
        print("Correct!");
        score++;
      } else {
        print("Incorrect. The correct answer is: ${question.answer}");
      }
    }

    final percentage = (score / questions.length * 100).toStringAsFixed(2);

    print("Total Correct Answers: $score/${questions.length}");
    print("Percentage: $percentage%");

    if (score > questions.length / 2) {
      print("Congratulations! You did a great job!");
    } else {
      print("Keep practicing to improve your score!");
    }
  }

  String promptForAnswer() {
    print("Your answer: ");
    return stdin.readLineSync()?.trim() ?? '';
  }

  List<int> generateRandomIndices(int length) {
    final max = length;
    final rand = Random();
    final randList = <int>[];
    while (randList.length < 20) {
      final randomNumber = rand.nextInt(max);
      if (!randList.contains(randomNumber)) {
        randList.add(randomNumber);
      }
    }
    return randList;
  }
}

class Question {
  final String question;
  final String answer;

  Question(this.question, this.answer);
}