class Validator {
  static const List<String> _basicOperators = ['+', '-', '*', '/', 'sqrt','!',"n", "s", "t", "r", "q", "("];
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
    // Loop through the question string to identify where `*` should be inserted
    for (int i = 1; i < _question.length; i++) {

      if (_question[i] == '(' && !_basicOperators.contains(_question[i - 1]) && (_question[i] == '(' && (_question[i-1] != 't') ))  {

        if(i > 3) {
          if(_question[i-3] == 'g') {
            continue;
          }
        }
        _question = _question.substring(0, i) + '*' + _question.substring(i);
        i++;
      }

      if ((_question[i] == 'L' || _question[i] == 'l') && !_basicOperators.contains(_question[i - 1]))  {
        _question = _question.substring(0, i) + '*' + _question.substring(i);
        i++;
      }

      if ((_question[i] == 'c') && !_basicOperators.contains(_question[i - 1]))  {
        _question = _question.substring(0, i) + '*' + _question.substring(i);
        i++;
      }

      if ((_question[i] == 't') && !_basicOperators.contains(_question[i - 1]))  {
        _question = _question.substring(0, i) + '*' + _question.substring(i);
        i++;
      }

      if(i >= 2) {
        if ((_question[i] == 'i') )  {
          if ((_question[i-1] == 's') && !_basicOperators.contains(_question[i - 2]))  {
            _question = _question.substring(0, i-1) + '*' + _question.substring(i-1);
            i++;
          }
        }
      }

      if (i >= 4 &&
          _question.substring(i - 3, i + 1) == 'sqrt' &&
          !_basicOperators.contains(_question[i - 4])) {
        _question = _question.substring(0, i - 3) + '*' + _question.substring(i - 3);
        i++;
      }


      // Case 1: Insert * if a number or ')' is directly followed by Log10(...) or !(...)
      if (_isDigitOrClosingParen(i - 1) && (_isLog10Start(i) || _isFactorialStart(i))) {

        _question = _question.substring(0, i) + '*' + _question.substring(i);
        i++; // Move to the next character to avoid infinite loop
      }
      // Case 2: Insert * if Log10(...) or !(...) is directly followed by a number or another Log10(...) or !(...)
      else if ((_isLog10End(i - 1) || _isFactorialEnd(i - 1)) && (_isDigit(i) || _isLog10Start(i) || _isFactorialStart(i))) {
        _question = _question.substring(0, i) + '*' + _question.substring(i);
        i++; // Move to the next character after inserting '*'
      }
    }
  }

// Helper to check if a character is a digit or closing parenthesis
  bool _isDigitOrClosingParen(int index) {
    return index >= 0 && (_question[index].contains(RegExp(r'\d')) || _question[index] == ')');
  }

// Helper to check if the substring starting at index is "Log10"
  bool _isLog10Start(int index) {
    return index + 4 < _question.length && _question.substring(index, index + 5) == 'Log10';
  }

// Helper to check if a character is a factorial start
  bool _isFactorialStart(int index) {
    return index < _question.length && _question[index] == '!';
  }

// Helper to check if a character is a digit
  bool _isDigit(int index) {
    return index >= 0 && index < _question.length && _question[index].contains(RegExp(r'\d'));
  }

// Helper to check if Log10(...) has just ended before the index
  bool _isLog10End(int index) {
    return index >= 4 && _question.substring(index - 4, index + 1) == 'Log10';
  }

// Helper to check if a factorial expression !(...) has just ended before the index
  bool _isFactorialEnd(int index) {
    return index >= 1 && _question[index] == ')';
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