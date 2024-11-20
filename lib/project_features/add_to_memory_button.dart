import '../base_project/command.dart';

class MemoryAddCommand implements Command {
  static final List<String> answerMemory = List.empty(growable: true);

  @override
  List<String> execute(String userQuestion, String userAnswer) {
    String question = userQuestion;
    String answer = userAnswer;
    
      answerMemory.add(userAnswer);

    return [question, answer];
  }
}