import 'package:calculator/project_features/logarithmic_function_button.dart';
import 'package:test/test.dart';
import 'dart:math';

void main() {
  group('NaturalLogCommand Tests', () {
    late NaturalLogCommand lnCommand;

    setUp(() {
      lnCommand = NaturalLogCommand();
    });

    test('Verify calculation for ln(1)', () {

      final finalOutputs = lnCommand.execute('ln(1', '=');

      final finalAnswer = finalOutputs[1];

      expect(finalAnswer, equals('0.000000'), reason: 'ln(1) should evaluate to 0.');
    });

    test('Verify calculation for ln(2)', () {

      final finalOutputs = lnCommand.execute('ln(2', '=');
      final finalAnswer = finalOutputs[1];

      expect(finalAnswer, equals(log(2).toStringAsFixed(6)), reason: 'ln(2) calculation failed.');
    });

    test('Verify calculation for ln(3)', () {

      final finalOutputs = lnCommand.execute('ln(3', '=');
      final finalAnswer = finalOutputs[1];

      expect(finalAnswer, equals(log(3).toStringAsFixed(6)), reason: 'ln(3) calculation failed.');
    });

    test('Verify calculation for ln(4)', () {

      final finalOutputs = lnCommand.execute('ln(4', '=');
      final finalAnswer = finalOutputs[1];

      expect(finalAnswer, equals(log(4).toStringAsFixed(6)), reason: 'ln(4) calculation failed.');
    });

    test('Verify calculation for ln(5)', () {

      final finalOutputs = lnCommand.execute('ln(5', '=');
      final finalAnswer = finalOutputs[1];

      expect(finalAnswer, equals(log(5).toStringAsFixed(6)), reason: 'ln(5) calculation failed.');
    });

    test('Verify invalid input handling', () {

      final finalOutputs = lnCommand.execute('ln(-5', '=');
      final finalAnswer = finalOutputs[1];

      expect(finalAnswer.contains('Error'), isTrue, reason: 'ln(-5) should return an error.');
    });
  });
}

