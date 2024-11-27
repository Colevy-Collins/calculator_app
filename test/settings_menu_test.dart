import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calculator/project_features/settings_menu_button.dart';

void main() {
  group('SettingsWidget', () {
    testWidgets('should display correct initial button text', (WidgetTester tester) async {
      var widget = SettingsWidget(
        currentColor: Colors.blue,
        onColorChange: (color) {},
      );
      await tester.pumpWidget(MaterialApp(home: widget));
      expect(find.text('Change Menu Color to Purple'), findsOneWidget);
    });

    testWidgets('should call onColorChange with next color and close dialog on button press',
            (WidgetTester tester) async {
          bool onColorChangedCalled = false;
          Color? newColor;

          final widget = SettingsWidget(
            currentColor: Colors.blue,
            onColorChange: (color) {
              onColorChangedCalled = true;
              newColor = color;
            },
          );

          await tester.pumpWidget(MaterialApp(home: Scaffold(body: widget)));
          await tester.tap(find.text('Change Menu Color to Purple'));
          await tester.pumpAndSettle();
          expect(onColorChangedCalled, true);
          expect(newColor, Colors.purple);
          expect(find.byType(Dialog), findsNothing);
        });
  });

  group('SettingsCommand', () {
    test('should execute onSettingsPressed callback', () {
      bool wasPressed = false;

      final command = SettingsCommand(
        onSettingsPressed: () {
          wasPressed = true;
        },
      );

      command.execute('question', 'answer');

      expect(wasPressed, true);
    });

    test('should return a list with the question and answer', () {
      final command = SettingsCommand(
        onSettingsPressed: () {},
      );

      final result = command.execute('question', 'answer');

      expect(result, ['question', 'answer']);
    });
  });
}
