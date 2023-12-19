abstract class SignupEvent {}

class PersonalDetailsEvent extends SignupEvent {
  final String name;
  final String email;

  PersonalDetailsEvent(this.name, this.email);
}

class PinEvent extends SignupEvent {
  final String pin;

  PinEvent(this.pin);
}

class ClearEvent extends SignupEvent {
  ClearEvent();
}
