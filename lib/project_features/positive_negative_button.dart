import 'package:calculator/base_project/command.dart';

class PositiveNegativeCommand implements Command {
  @override
  List<String> execute(String userQuestion, String userAnswer) {
    String question = userQuestion;
    String answer = userAnswer;

    if(userQuestion.startsWith("-")) {
      question = userQuestion.substring(1); // Removes the negative sign
    } else {
      question = "-" + userQuestion; // Appends
    }// Appends
    return [question, answer]; // the button label to the current input
  }
}