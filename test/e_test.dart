import 'package:calculator/project_features/e_function_button.dart';
import 'package:test/test.dart';

void main() {
  group('ECommand Tests', () {
    late ECommand eCommand;

    setUp(() {
      eCommand = ECommand();
    });

    test('Verify calculation for 1e', () {
      final outputs = eCommand.execute('1', '=');
      final question = outputs[0];
      final answer = outputs[1];

      final expectedAnswer = (1 * 2.718281828).toStringAsFixed(6);
      expect(answer, equals(expectedAnswer), reason: 'Failed for input: 1');
      expect(question, equals('1e'), reason: 'Question should not alter after evaluation.');
    });

    test('Verify calculation for 2e', () {
      final outputs = eCommand.execute('2', '=');
      final question = outputs[0];
      final answer = outputs[1];

      final expectedAnswer = (2 * 2.718281828).toStringAsFixed(6);
      expect(answer, equals(expectedAnswer), reason: 'Failed for input: 2');
      expect(question, equals('2e'), reason: 'Question should not alter after evaluation.');
    });

    test('Verify calculation for 3e', () {
      final outputs = eCommand.execute('3', '=');
      final question = outputs[0];
      final answer = outputs[1];

      final expectedAnswer = (3 * 2.718281828).toStringAsFixed(6);
      expect(answer, equals(expectedAnswer), reason: 'Failed for input: 3');
      expect(question, equals('3e'), reason: 'Question should not alter after evaluation.');
    });

    test('Verify calculation for 4e', () {
      final outputs = eCommand.execute('4', '=');
      final question = outputs[0];
      final answer = outputs[1];

      final expectedAnswer = (4 * 2.718281828).toStringAsFixed(6);
      expect(answer, equals(expectedAnswer), reason: 'Failed for input: 4');
      expect(question, equals('4e'), reason: 'Question should not alter after evaluation.');
    });

    test('Verify calculation for 5e', () {
      final outputs = eCommand.execute('5', '=');
      final question = outputs[0];
      final answer = outputs[1];

      final expectedAnswer = (5 * 2.718281828).toStringAsFixed(6);
      expect(answer, equals(expectedAnswer), reason: 'Failed for input: 5');
      expect(question, equals('5e'), reason: 'Question should not alter after evaluation.');
    });
    test('Verify "e" button press appends correctly', () {
      final outputs = eCommand.execute('5', ''); // Simulate pressing the "e" button
      final question = outputs[0];
      final answer = outputs[1];

      expect(question, equals('5e'), reason: 'Button press did not append "e" correctly to the question.');
      expect(answer, equals(''), reason: 'Answer should remain unchanged until "=" is pressed.');
    });

    test('Verify invalid input handling', () {
      final outputs = eCommand.execute('invalid', '=');
      final question = outputs[0];
      final answer = outputs[1];

      expect(answer, equals('Error'), reason: 'Should return "Error" for invalid input.');
      expect(question.contains('invalid'), isTrue, reason: 'Question should still contain the invalid input.');
    });
  });
}
