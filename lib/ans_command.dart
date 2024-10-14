import 'command.dart';


class ANSCommand implements Command {
  @override
  List<String> execute(String userQuestion, String userAnswer) {
    String question = userQuestion;
    String answer = userAnswer;

    question = answer; // Appends
    return [question, answer]; // the button label to the current input
  }
}