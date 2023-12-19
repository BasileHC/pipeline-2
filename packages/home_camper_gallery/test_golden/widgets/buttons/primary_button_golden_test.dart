import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_camper_gallery/widgets/buttons/primary_button.dart';

void main() {
  testWidgets('PrimaryButton golden test', (WidgetTester tester) async {
    await tester.pumpWidget(
      SizedBox(
        width: 200,
        height: 100,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PrimaryButton(
                onPressed: () {},
                text: 'buttonText',
              ),
            ],
          ),
        ),
      ),
    );
    await expectLater(
      find.byType(PrimaryButton),
      matchesGoldenFile('primary_button_golden.png'),
    );
  });
}
