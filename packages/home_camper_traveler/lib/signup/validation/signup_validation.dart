import 'package:home_camper_traveler/signup/Strings/signup_validation_strings.dart';
import 'package:home_camper_traveler/signup/constants/signup_constants.dart';

final RegExp nameRegExp = RegExp(r'^[a-zA-Z]+$');
final RegExp emailRegExp = RegExp(r'^[a-zA-Z0-9.+]+@[a-zA-Z0-9]+\.[a-zA-Z]+');
final RegExp numberRegExp = RegExp(r'^[0-9]+$');

String? validateName(String? value) {
  if (value == null || value.isEmpty) {
    return SignupValidationStrings.nameEmpty;
  }
  if (!nameRegExp.hasMatch(value)) {
    return SignupValidationStrings.nameContainsSpecialCharacters;
  }
  if (value.length < 2) {
    return SignupValidationStrings.nameTooShort;
  }
  return null;
}

String? validateEmail(String? value) {
  if (value == null || value.isEmpty) {
    return SignupValidationStrings.emailEmpty;
  }
  if (!emailRegExp.hasMatch(value)) {
    return SignupValidationStrings.emailInvalid;
  }
  return null;
}

String? validatePin(String pin) {
  if (pin.length != SignupConstants.pinLength) {
    return SignupValidationStrings.pinTooShort;
  }
  if (!numberRegExp.hasMatch(pin)) {
    return SignupValidationStrings.pinMustBeNumbers;
  }
  if ("0123456789".contains(pin) || "9876543210".contains(pin)) {
    return SignupValidationStrings.pinSequence;
  }

  // split the pin into a list of characters and count how many times each character appears
  Map<String, int> counts = {};
  pin.split("").forEach((element) {
    counts.update(
      element,
      (value) => ++value,
      ifAbsent: () => 1,
    );
  });

  if (counts.values.any((count) => count > 2)) {
    return SignupValidationStrings.pinRepeatingNumbers;
  }

  return null;
}
