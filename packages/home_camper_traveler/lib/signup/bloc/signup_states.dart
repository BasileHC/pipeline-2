import 'package:equatable/equatable.dart';

class SignupState extends Equatable {
  final String name;
  final String email;
  final String pin;

  const SignupState({
    required this.name,
    required this.email,
    required this.pin,
  });

  SignupState copyWith({
    String? name,
    String? email,
    String? pin,
  }) {
    return SignupState(
      name: name ?? this.name,
      email: email ?? this.email,
      pin: pin ?? this.pin,
    );
  }

  @override
  List<Object> get props => [name, email, pin];
}

class SignupInitialState extends SignupState {
  const SignupInitialState() : super(name: "", email: "", pin: "");
}
