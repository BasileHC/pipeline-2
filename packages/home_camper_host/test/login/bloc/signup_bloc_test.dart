import 'package:flutter_test/flutter_test.dart';
import 'package:home_camper_host/signup/bloc/signup_bloc.dart';
import 'package:home_camper_host/signup/bloc/signup_events.dart';
import 'package:home_camper_host/signup/bloc/signup_states.dart';

void main() {
  SignupBloc? bloc;

  setUp(() {
    bloc = SignupBloc();
  });

  tearDown(() {
    bloc?.close();
  });

  test('initial state is correct', () {
    expect(bloc!.state, const SignupInitialState());
  });

  test('close does not emit new states', () {
    expectLater(
      bloc!.stream,
      emitsInOrder([emitsDone]),
    );
    bloc!.close();
  });

  test('new states are emitted correctly', () {
    expectLater(
      bloc!.stream,
      emitsInOrder([
        const SignupState(name: "Tim", email: "tim@test.com", pin: ''),
        const SignupState(name: "Tim", email: "tim@test.com", pin: '112233'),
        const SignupInitialState(),
        emitsDone
      ]),
    );

    bloc!.add(PersonalDetailsEvent("Tim", "tim@test.com"));
    bloc!.add(PinEvent("112233"));
    bloc!.add(ClearEvent());
    bloc!.close();
  });
}
