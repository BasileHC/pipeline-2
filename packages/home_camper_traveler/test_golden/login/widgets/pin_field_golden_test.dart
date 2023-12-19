import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:home_camper_traveler/signup/widgets/pin_field.dart';

void main() {
  testWidgets('PinField golden test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const SizedBox(
        width: 400,
        height: 200,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: PinField(
            pin: '123',
            pinLength: 6,
          ),
        ),
      ),
    );
    await expectLater(
      find.byType(PinField),
      matchesGoldenFile('pin_field_golden.png'),
    );
  });
}
