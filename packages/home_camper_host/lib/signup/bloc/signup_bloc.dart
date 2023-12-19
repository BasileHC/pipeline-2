import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_camper_host/signup/bloc/signup_events.dart';
import 'package:home_camper_host/signup/bloc/signup_states.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(const SignupInitialState()) {
    on<PersonalDetailsEvent>(_nameEmailEvent);
    on<PinEvent>(_pinEvent);
    on<ClearEvent>(_clearEvent);
  }

  void _nameEmailEvent(PersonalDetailsEvent event, Emitter<SignupState> emit) {
    debugPrint("name: ${event.name}\nemail: ${event.email}");
    emit(state.copyWith(name: event.name, email: event.email));
  }

  void _pinEvent(PinEvent event, Emitter<SignupState> emit) {
    debugPrint("PIN: ${event.pin}");
    emit(state.copyWith(pin: event.pin));
  }

  void _clearEvent(ClearEvent event, Emitter<SignupState> emit) {
    debugPrint("Cleared");
    emit(const SignupInitialState());
  }
}
