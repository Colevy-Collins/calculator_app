// Adds the current userAnswer to a list for later retrieval.
// Where to put list for further reach? Into main.dart?
import '../base_project/command.dart';

class MemoryAddCommand implements Command {
  @override
  List<String> execute(String userQuestion, String userAnswer) {
    String question = userQuestion;
    String answer = userAnswer;

     List<String> answerMemory = new List<String>();
    
      answerMemory.add(userAnswer);

    return [question, answer];

  }
}