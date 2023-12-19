mixin SignupValidationStrings {
  static String nameEmpty = 'Please enter your name';
  static String nameTooShort = 'Your name must be at least two characters long';
  static String nameContainsSpecialCharacters =
      'Your name must only contain letters';

  static String emailEmpty = 'Please enter your email';
  static String emailInvalid = 'Please enter a valid email address';

  static String pinTooShort = 'Your PIN must contain 6 numbers';
  static String pinMustBeNumbers = 'Your PIN must only contain numbers';
  static String pinSequence =
      'Your PIN must not be a simple sequence (e.g. 123456, 234567, 456789)';
  static String pinRepeatingNumbers =
      'Your PIN must not contain the same number more than twice';
}
