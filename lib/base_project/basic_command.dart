import 'command.dart';


class BasicCommand implements Command {
  final String buttonLabel;

  BasicCommand(this.buttonLabel);

  @override
  List<String> execute(String userQuestion, String userAnswer) {
    String question = userQuestion;
    String answer = userAnswer;

    question = question + buttonLabel; // Appends
    return [question, answer]; // the button label to the current input
  }
}