class Validator {
  static const List<String> _basicOperators = ['+', '-', '*', '/'];
  late String _question;
  late String _answer;
  bool _error = false;

  String get getQuestion => _question;
  String get getAnswer => _answer;
  bool get getError => _error;


  Validator(userQuestion, userAnswer) {
    _question = userQuestion;
    _answer = userAnswer;

    validateClosedParentheses();
    validateOperatorBeforeParentheses();

  }

  void validateOperatorBeforeParentheses() {
    // Add * before ( if it does not have a basic operator before it
    for (int i = 1; i < _question.length; i++) {
      if (_question[i] == '(' && !_basicOperators.contains(_question[i - 1])) {
        _question = _question.substring(0, i) + '*' + _question.substring(i);
        i++; // Move to the next character to avoid infinite loop
      }
    }
  }

  void validateClosedParentheses() {
    // Verify that every '(' has a corresponding ')'
    int openParens = 0;
    for (int i = 0; i < _question.length; i++) {
      if (_question[i] == '(') {
        openParens++;
      } else if (_question[i] == ')') {
        openParens--;
      }
      if (openParens < 0) {
        _answer = 'Error: Unmatched parenthesis';
        _error = true;
      }
    }
    if (openParens != 0) {
      _answer = 'Error: Unmatched parenthesis';
      _error = true;
    }
  }
}