import 'package:flutter_test/flutter_test.dart';
import 'package:calculator/project_features/trig_functions_button.dart';

void main() {
  group('SinCommand', () {
    test('should append sin() to the question', () {
      final command = SinCommand();
      final result = command.execute('2 + ', '');

      expect(result[0], '2 + sin(');
      expect(result[1], '');
    });
  });

  group('CosCommand', () {
    test('should append cos() to the question', () {
      final command = CosCommand();
      final result = command.execute('3 + ', '');

      expect(result[0], '3 + cos(');
      expect(result[1], '');
    });
  });

  group('TanCommand', () {
    test('should append tan() to the question', () {
      final command = TanCommand();
      final result = command.execute('5 + ', '');

      expect(result[0], '5 + tan(');
      expect(result[1], '');
    });
  });
}
