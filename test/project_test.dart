import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:calculator/main.dart';
import 'package:calculator/base_project/command_export.dart';

Future<void> tapButtonAndVerify(tester, input) async{
  await tester.tap(find.widgetWithText(MyButton, input));
  await tester.pump();
  expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('$input'), isTrue);
}

void main() {
  testWidgets('Test just square root', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    //Test just square root
    await tester.tap(find.text('√'));
    await tester.pump();

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('sqrt('), isTrue);

    await tapButtonAndVerify(tester, '2');
    await tapButtonAndVerify(tester, '5');
    await tapButtonAndVerify(tester, ')');

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('5.0'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();
  });
  testWidgets('Test square root with expression and without operator', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tapButtonAndVerify(tester, '1');
    await tester.pump();


    await tester.tap(find.text('√'));
    await tester.pump();


    await tapButtonAndVerify(tester, '2');
    await tapButtonAndVerify(tester, '5');
    await tapButtonAndVerify(tester, ')');


    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('5.0'), isTrue);
    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('1*sqrt(25)'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();

  });
  testWidgets('Test nested square root', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('√'));
    await tester.pump();

    await tester.tap(find.text('√'));
    await tester.pump();

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('sqrt('), isTrue);

    await tapButtonAndVerify(tester, '6');
    await tapButtonAndVerify(tester, '2');
    await tapButtonAndVerify(tester, '5');
    await tapButtonAndVerify(tester, ')');
    await tapButtonAndVerify(tester, ')');

    await tester.tap(find.text('='));
    await tester.pump();


    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('5.0'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();
  });
  testWidgets("Test square root with nested expression", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('√'));
    await tester.pump();

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('sqrt('), isTrue);

    await tapButtonAndVerify(tester, '2');
    await tapButtonAndVerify(tester, '0');
    await tapButtonAndVerify(tester, '+');
    await tapButtonAndVerify(tester, '5');
    await tapButtonAndVerify(tester, ')');

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('5.0'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();
  });
  testWidgets("Test unclosed square root", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('√'));
    await tester.pump();

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('sqrt('), isTrue);

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('Error: Unmatched parenthesis'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();
  });
  testWidgets("Test square root invalid expression", (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('√'));
    await tester.pump();

    await tapButtonAndVerify(tester, ")");

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('sqrt()'), isTrue);

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('Error: Invalid Expression'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();
  });

  testWidgets('Test just power', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tapButtonAndVerify(tester, '2');

    await tester.tap(find.text('xʸ'));
    await tester.pump();

    await tapButtonAndVerify(tester, '2');

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('^'), isTrue);

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('4.0'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();

  });
  testWidgets('Test power with expressions', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tapButtonAndVerify(tester, '2');
    await tapButtonAndVerify(tester, '2');
    await tapButtonAndVerify(tester, '*');
    await tapButtonAndVerify(tester, '2');


    await tester.tap(find.text('xʸ'));
    await tester.pump();

    await tapButtonAndVerify(tester, '2');

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('88.0'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();

  });
  testWidgets('Test nested power', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tapButtonAndVerify(tester, '2');

    await tester.tap(find.text('xʸ'));
    await tester.pump();

    await tapButtonAndVerify(tester, '2');

    await tester.tap(find.text('xʸ'));
    await tester.pump();

    await tapButtonAndVerify(tester, '2');

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('16.0'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();

  });
  testWidgets('Test power with nest expression', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tapButtonAndVerify(tester, '2');

    await tester.tap(find.text('xʸ'));
    await tester.pump();

    await tapButtonAndVerify(tester, '2');

    await tapButtonAndVerify(tester, '+');

    await tapButtonAndVerify(tester, '2');

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('6.0'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();

  });
  testWidgets('Test power expression error', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('xʸ'));
    await tester.pump();

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('^'), isTrue);

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('Error: Invalid Expression'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();

  });

  testWidgets('Test pie', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('π'));
    await tester.pump();

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('3.141592653589793'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();
  });

  testWidgets('Test just ln', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('ln('));
    await tester.pump();

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('ln('), isTrue);

    await tapButtonAndVerify(tester, '2');
    await tapButtonAndVerify(tester, '5');
    await tapButtonAndVerify(tester, ')');

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('3.2188758248682006'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();
  });
  testWidgets('Test single ln', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('ln('));
    await tester.pump();

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('ln('), isTrue);

    await tapButtonAndVerify(tester, '2');
    await tapButtonAndVerify(tester, '5');
    await tapButtonAndVerify(tester, ')');

    await tester.tap(find.text('ln('));
    await tester.pump();

    expect(RegExp(r'ln\(').allMatches(find.byKey(Key('userQuestion')).evaluate().single.widget.toString()).length == 1, isTrue);

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('3.2188758248682006'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();
  });
  testWidgets('Test ln with expression', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tapButtonAndVerify(tester, '1');
    await tester.tap(find.text('ln('));
    await tester.pump();

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('ln('), isTrue);

    await tapButtonAndVerify(tester, '2');
    await tapButtonAndVerify(tester, '5');
    await tapButtonAndVerify(tester, ')');
    await tapButtonAndVerify(tester, '+');
    await tapButtonAndVerify(tester, '5');

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('1ln(25)+5'), isTrue);

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('1*ln(25)+5'), isTrue);

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('8.218875824868201'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();
  });
  testWidgets('Test ln with nested expression', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('ln('));
    await tester.pump();

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('ln('), isTrue);

    await tapButtonAndVerify(tester, '2');
    await tapButtonAndVerify(tester, '+');
    await tapButtonAndVerify(tester, '5');
    await tapButtonAndVerify(tester, ')');

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('1.9459101490553132'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();
  });
  testWidgets('Test ln with invalid expression', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('ln('));
    await tester.pump();

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('ln('), isTrue);

    await tapButtonAndVerify(tester, ')');

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('Error: Invalid Expression'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();
  });

  testWidgets('Test just n!', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('!('));
    await tester.pump();

    await tapButtonAndVerify(tester, '5');
    await tapButtonAndVerify(tester, ')');

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('!'), isTrue);

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('120.0'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();
  });
  testWidgets('Test n! with expression', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tapButtonAndVerify(tester, '1');

    await tester.tap(find.text('!('));
    await tester.pump();

    await tapButtonAndVerify(tester, '5');
    await tapButtonAndVerify(tester, ')');

    await tapButtonAndVerify(tester, '+');
    await tapButtonAndVerify(tester, '5');

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('!'), isTrue);

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('125.0'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();
  });
  testWidgets('Test n! nested', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.widgetWithText(MyButton, "!("));
    await tester.pump();

    await tester.tap(find.widgetWithText(MyButton, "!("));
    await tester.pump();

    await tapButtonAndVerify(tester, '3');
    await tapButtonAndVerify(tester, ')');
    await tapButtonAndVerify(tester, ')');

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('720.0'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();
  });
  testWidgets('Test n! with nested expression', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('!('));
    await tester.pump();

    await tapButtonAndVerify(tester, '2');
    await tapButtonAndVerify(tester, '+');
    await tapButtonAndVerify(tester, '3');
    await tapButtonAndVerify(tester, ')');

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('!'), isTrue);

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('120.0'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();
  });
  testWidgets('Test n! with invalid expression', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('!('));
    await tester.pump();

    await tapButtonAndVerify(tester, ')');

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('!'), isTrue);

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('Error: Invalid Expression'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();
  });

  testWidgets('Test just Log10', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Log10()'));
    await tester.pump();

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('Log10('), isTrue);

    await tapButtonAndVerify(tester, '1');
    await tapButtonAndVerify(tester, '0');
    await tapButtonAndVerify(tester, ')');

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('Log10(10)'), isTrue);

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('1.0'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();
  });
  testWidgets('Test Log10 with expression', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tapButtonAndVerify(tester, '1');

    await tester.tap(find.text('Log10()'));
    await tester.pump();

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('Log10('), isTrue);

    await tapButtonAndVerify(tester, '1');
    await tapButtonAndVerify(tester, '0');
    await tapButtonAndVerify(tester, ')');
    await tapButtonAndVerify(tester, '+');
    await tapButtonAndVerify(tester, '5');

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('1Log10(10)+5'), isTrue);

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('6.0'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();
  });
  testWidgets('Test Log10 nested', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Log10()'));
    await tester.pump();

    await tester.tap(find.text('Log10()'));
    await tester.pump();

    await tapButtonAndVerify(tester, '1');
    await tapButtonAndVerify(tester, '0');
    await tapButtonAndVerify(tester, ')');
    await tapButtonAndVerify(tester, '*');
    await tapButtonAndVerify(tester, '1');
    await tapButtonAndVerify(tester, '0');
    await tapButtonAndVerify(tester, ')');

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('1.0'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();
  });
  testWidgets('Test Log10 with nested expression', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Log10()'));
    await tester.pump();

    await tapButtonAndVerify(tester, '2');
    await tapButtonAndVerify(tester, '+');
    await tapButtonAndVerify(tester, '3');
    await tapButtonAndVerify(tester, ')');

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('Log10(2+3)'), isTrue);

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('0.6989700043360187'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();
  });
  testWidgets('Test Log10 with invalid expression', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Log10()'));
    await tester.pump();

    await tapButtonAndVerify(tester, ')');

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('Log10('), isTrue);

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('Error: Invalid Expression'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();
  });

  testWidgets('Test e', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('1'));

    await tester.tap(find.text('e'));
    await tester.pump();

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('e'), isTrue);

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('2.718281828459045'), isTrue);
  });
  testWidgets('Test errors with e', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('e'));
    await tester.pump();

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('e'), isTrue);

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('Error: Invalid Expression'), isTrue);
  });

  testWidgets('Test just squared', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tapButtonAndVerify(tester, '2');

    await tester.tap(find.text('x²'));
    await tester.pump();

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('^2'), isTrue);

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('4.0'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();

  });
  testWidgets('Test squared with expressions', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tapButtonAndVerify(tester, '2');
    await tapButtonAndVerify(tester, '2');
    await tapButtonAndVerify(tester, '*');
    await tapButtonAndVerify(tester, '2');


    await tester.tap(find.text('x²'));
    await tester.pump();

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('88.0'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();

  });
  testWidgets('Test nested squared', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tapButtonAndVerify(tester, '2');

    await tester.tap(find.text('x²'));
    await tester.pump();

    await tester.tap(find.text('x²'));
    await tester.pump();

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('16.0'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();

  });
  testWidgets('Test squared with nest expression', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tapButtonAndVerify(tester, '2');

    await tester.tap(find.text('x²'));
    await tester.pump();

    await tapButtonAndVerify(tester, '+');

    await tapButtonAndVerify(tester, '2');

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('6.0'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();

  });
  testWidgets('Test squared expression error', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('x²'));
    await tester.pump();

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('^2'), isTrue);

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('Error: Invalid Expression'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();

  });

  testWidgets('Test just sin', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('sin'));
    await tester.pump();

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('sin('), isTrue);

    await tapButtonAndVerify(tester, '9');
    await tapButtonAndVerify(tester, '0');
    await tapButtonAndVerify(tester, ')');

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('0.8939966636005579'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();
  });
  testWidgets('Test sin with expression', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tapButtonAndVerify(tester, '1');

    await tester.tap(find.text('sin'));
    await tester.pump();

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('sin('), isTrue);

    await tapButtonAndVerify(tester, '9');
    await tapButtonAndVerify(tester, '0');
    await tapButtonAndVerify(tester, ')');
    await tapButtonAndVerify(tester, '+');
    await tapButtonAndVerify(tester, '5');

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('1sin(90)+5'), isTrue);

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('1*sin(90)+5'), isTrue);

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('5.893996663600558'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();
  });
  testWidgets('Test nested sin', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('sin'));
    await tester.pump();

    await tester.tap(find.text('sin'));
    await tester.pump();

    await tapButtonAndVerify(tester, '9');
    await tapButtonAndVerify(tester, '0');
    await tapButtonAndVerify(tester, ')');
    await tapButtonAndVerify(tester, ')');

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('0.77958108276669'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();
  });
  testWidgets('Test sin with nest expression', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('sin'));
    await tester.pump();

    await tapButtonAndVerify(tester, '9');
    await tapButtonAndVerify(tester, '0');
    await tapButtonAndVerify(tester, '+');
    await tapButtonAndVerify(tester, '5');
    await tapButtonAndVerify(tester, ')');

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('0.683261714736121'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();
  });
  testWidgets('Test sin with invalid expression', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('sin'));
    await tester.pump();

    await tapButtonAndVerify(tester, ')');

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('sin()'), isTrue);

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('Error: Invalid Expression'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();
  });

  testWidgets('Test just cos', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('cos'));
    await tester.pump();

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('cos('), isTrue);

    await tapButtonAndVerify(tester, '9');
    await tapButtonAndVerify(tester, '0');
    await tapButtonAndVerify(tester, ')');

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('-0.4480736161291701'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();
  });
  testWidgets('Test cos with expression', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tapButtonAndVerify(tester, '1');

    await tester.tap(find.text('cos'));
    await tester.pump();

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('cos('), isTrue);

    await tapButtonAndVerify(tester, '9');
    await tapButtonAndVerify(tester, '0');
    await tapButtonAndVerify(tester, ')');
    await tapButtonAndVerify(tester, '+');
    await tapButtonAndVerify(tester, '5');

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('1cos(90)+5'), isTrue);

    await tester.tap(find.text('='));
    await tester.pump();
    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('1*cos(90)+5'), isTrue);

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('4.55192638387083'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();
  });
  testWidgets('Test nested cos', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('cos'));
    await tester.pump();

    await tester.tap(find.text('cos'));
    await tester.pump();

    await tapButtonAndVerify(tester, '9');
    await tapButtonAndVerify(tester, '0');
    await tapButtonAndVerify(tester, ')');
    await tapButtonAndVerify(tester, ')');

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('0.9012833416649748'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();
  });
  testWidgets('Test cos with nest expression', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('cos'));
    await tester.pump();

    await tapButtonAndVerify(tester, '9');
    await tapButtonAndVerify(tester, '0');
    await tapButtonAndVerify(tester, '+');
    await tapButtonAndVerify(tester, '5');
    await tapButtonAndVerify(tester, ')');

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('0.7301735609948197'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();
  });
  testWidgets('Test cos with invalid expression', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('cos'));
    await tester.pump();

    await tapButtonAndVerify(tester, ')');

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('cos()'), isTrue);

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('Error: Invalid Expression'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();
  });

  testWidgets('Test just tan', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('tan'));
    await tester.pump();

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('tan('), isTrue);

    await tapButtonAndVerify(tester, '9');
    await tapButtonAndVerify(tester, '0');
    await tapButtonAndVerify(tester, ')');

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('-1.995200412208242'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();
  });
  testWidgets('Test tan with expression', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tapButtonAndVerify(tester, '1');

    await tester.tap(find.text('tan'));
    await tester.pump();

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('tan('), isTrue);

    await tapButtonAndVerify(tester, '9');
    await tapButtonAndVerify(tester, '0');
    await tapButtonAndVerify(tester, ')');
    await tapButtonAndVerify(tester, '+');
    await tapButtonAndVerify(tester, '5');

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('1tan(90)+5'), isTrue);

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('1*tan(90)+5'), isTrue);

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('3.0047995877917577'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();
  });
  testWidgets('Test nested tan', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('tan'));
    await tester.pump();

    await tester.tap(find.text('tan'));
    await tester.pump();

    await tapButtonAndVerify(tester, '9');
    await tapButtonAndVerify(tester, '0');
    await tapButtonAndVerify(tester, ')');
    await tapButtonAndVerify(tester, ')');

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('2.2130485494893297'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();
  });
  testWidgets('Test tan with nest expression', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('tan'));
    await tester.pump();

    await tapButtonAndVerify(tester, '9');
    await tapButtonAndVerify(tester, '0');
    await tapButtonAndVerify(tester, '+');
    await tapButtonAndVerify(tester, '5');
    await tapButtonAndVerify(tester, ')');

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('0.9357524720632393'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();
  });
  testWidgets('Test tan with invalid expression', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('tan'));
    await tester.pump();

    await tapButtonAndVerify(tester, ')');

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('tan()'), isTrue);

    await tester.tap(find.text('='));
    await tester.pump();

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('Error: Invalid Expression'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();
  });

  testWidgets('Test M+', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tapButtonAndVerify(tester, '2');
    await tapButtonAndVerify(tester, '+');
    await tapButtonAndVerify(tester, '2');

    await tester.tap(find.text('='));
    await tester.pump();

    await tester.tap(find.text('M+'));
    await tester.pump();

    await tester.tap(find.text('+'));
    await tester.pump();

    await tester.tap(find.text('M+'));
    await tester.pump();

    expect(find.byKey(Key('userQuestion')).evaluate().single.widget.toString().contains('2+2+4.0'), isTrue);

    expect(find.byKey(Key('userAnswer')).evaluate().single.widget.toString().contains('8.0'), isTrue);

    await tester.tap(find.text('C'));
    await tester.pump();
  });

}
