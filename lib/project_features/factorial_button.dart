import '../base_project/command.dart';


class FactorialCommand implements Command {

  FactorialCommand();

  @override
  List<String> execute(String userQuestion, String userAnswer) {
    String question = userQuestion;
    String answer = userAnswer;

    question = question + "!("; // Appends
    return [question, answer]; // the button label to the current input
  }
}