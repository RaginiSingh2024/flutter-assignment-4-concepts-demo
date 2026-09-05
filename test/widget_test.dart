import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:assignment_4_concepts_demo/main.dart';

void main() {
  testWidgets('HomeScreen renders and navigates to all 3 screens',
      (WidgetTester tester) async {
    // Set view size to typical mobile/tablet display
    tester.view.physicalSize = const Size(1080, 1920);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(const ConceptsDemoApp());
    await tester.pumpAndSettle();

    // 1. Verify HomeScreen elements
    expect(find.text('Flutter Concepts Demo'), findsOneWidget);
    expect(find.text('User Input & Forms'), findsOneWidget);
    expect(find.text('Images, Assets & Fonts'), findsOneWidget);
    expect(find.text('Animations'), findsOneWidget);

    // 2. Test Navigation to Concept 1 (Form)
    await tester.tap(find.text('User Input & Forms'));
    await tester.pumpAndSettle();
    expect(find.text('Student Registration Form'), findsOneWidget);

    // Test Form validation with empty fields
    await tester.ensureVisible(find.text('Submit Application'));
    await tester.tap(find.text('Submit Application'));
    await tester.pumpAndSettle();
    expect(find.text('Please enter your full name'), findsOneWidget);
    expect(find.text('Please enter your email address'), findsOneWidget);
    expect(find.text('Please enter your phone number'), findsOneWidget);
    expect(find.text('Please enter your course or program'), findsOneWidget);

    // Fill valid data
    await tester.enterText(
        find.widgetWithText(TextFormField, 'Full Name *'), 'Alex Johnson');
    await tester.enterText(
        find.widgetWithText(TextFormField, 'Student Email *'),
        'alex@university.edu');
    await tester.enterText(
        find.widgetWithText(TextFormField, 'Phone Number *'), '9876543210');
    await tester.enterText(
        find.widgetWithText(TextFormField, 'Course / Program *'),
        'Computer Science');
    await tester.pumpAndSettle();

    // Submit valid form
    await tester.ensureVisible(find.text('Submit Application'));
    await tester.tap(find.text('Submit Application'));
    await tester.pumpAndSettle();
    expect(find.byType(SnackBar), findsOneWidget);
    expect(find.textContaining('Success! "Alex Johnson"'), findsOneWidget);

    // Return to Home
    await tester.pageBack();
    await tester.pumpAndSettle();
    expect(find.text('Flutter Concepts Demo'), findsOneWidget);

    // 3. Test Navigation to Concept 2 (Images & Assets)
    await tester.tap(find.text('Images, Assets & Fonts'));
    await tester.pumpAndSettle();
    expect(find.text('Images, Assets & Fonts'), findsWidgets);
    expect(find.byType(GridView), findsOneWidget);

    // Return to Home
    await tester.pageBack();
    await tester.pumpAndSettle();

    // 4. Test Navigation to Concept 3 (Animations)
    await tester.tap(find.text('Animations'));
    await tester.pumpAndSettle();
    expect(find.text('AnimatedContainer Demo'), findsOneWidget);
    expect(find.byType(AnimatedContainer), findsOneWidget);
    expect(find.text('State: Initial (A)'), findsOneWidget);

    // Trigger animation via button
    await tester.ensureVisible(find.text('Animate Container'));
    await tester.tap(find.text('Animate Container'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 750));
    expect(find.text('State: Transformed (B)'), findsOneWidget);

    // Trigger reset via button
    await tester.ensureVisible(find.text('Reset to Initial State'));
    await tester.tap(find.text('Reset to Initial State'));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 750));
    expect(find.text('State: Initial (A)'), findsOneWidget);
  });
}
