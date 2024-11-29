import '../base_project/command.dart';


class LogBase10Command implements Command {

  LogBase10Command();

  @override
  List<String> execute(String userQuestion, String userAnswer) {
    String question = userQuestion;
    String answer = userAnswer;

    question = question + "Log10("; // Appends
    return [question, answer]; // the button label to the current input
  }
}