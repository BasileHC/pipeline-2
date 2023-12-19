import 'package:flutter_test/flutter_test.dart';
import 'package:home_camper_traveler/signup/Strings/signup_validation_strings.dart';
import 'package:home_camper_traveler/signup/validation/signup_validation.dart';

void main() {
  group('validateName', () {
    test('name is empty', () {
      expect(
        validateName(''),
        SignupValidationStrings.nameEmpty,
      );
    });

    test('name is too short', () {
      expect(
        validateName('t'),
        SignupValidationStrings.nameTooShort,
      );
    });

    test('name is not only letters', () {
      expect(
        validateName('tim1'),
        SignupValidationStrings.nameContainsSpecialCharacters,
      );

      expect(
        validateName('tim_'),
        SignupValidationStrings.nameContainsSpecialCharacters,
      );
    });

    test('name is valid', () {
      expect(
        validateName('Tim'),
        null,
      );
    });
  });

  group('validateEmail', () {
    test('email is empty', () {
      expect(
        validateEmail(''),
        SignupValidationStrings.emailEmpty,
      );
    });

    test('name is invalid', () {
      expect(
        validateEmail('test.com'),
        SignupValidationStrings.emailInvalid,
      );

      expect(
        validateEmail('test@test'),
        SignupValidationStrings.emailInvalid,
      );
    });

    test('email is valid', () {
      expect(
        validateEmail('test@test.com'),
        null,
      );
    });
  });

  group('validatePin', () {
    test('PIN is too short', () {
      expect(
        validatePin('1233'),
        SignupValidationStrings.pinTooShort,
      );
    });

    test('PIN is not only numbers', () {
      expect(
        validatePin('123_45'),
        SignupValidationStrings.pinMustBeNumbers,
      );

      expect(
        validatePin('123a56'),
        SignupValidationStrings.pinMustBeNumbers,
      );
    });

    test('PIN is a sequence', () {
      expect(
        validatePin('123456'),
        SignupValidationStrings.pinSequence,
      );

      expect(
        validatePin('987654'),
        SignupValidationStrings.pinSequence,
      );

      expect(
        validatePin('345678'),
        SignupValidationStrings.pinSequence,
      );
    });

    test('PIN has repeating numbers', () {
      expect(
        validatePin('121213'),
        SignupValidationStrings.pinRepeatingNumbers,
      );
    });

    test('PIN is valid', () {
      expect(
        validatePin('121245'),
        null,
      );
    });
  });
}
