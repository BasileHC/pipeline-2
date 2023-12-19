import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_camper_gallery/widgets/buttons/secondary_button.dart';

void main() {
  testWidgets('SecondaryButton golden test', (WidgetTester tester) async {
    await tester.pumpWidget(
      SizedBox(
        width: 200,
        height: 100,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SecondaryButton(
                onPressed: () {},
                text: 'buttonText',
              ),
            ],
          ),
        ),
      ),
    );
    await expectLater(
      find.byType(SecondaryButton),
      matchesGoldenFile('secondary_button_golden.png'),
    );
  });
}
