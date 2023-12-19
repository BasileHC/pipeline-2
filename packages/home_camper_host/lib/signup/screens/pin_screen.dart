import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_camper_gallery/theme/text_styles.dart';
import 'package:home_camper_gallery/widgets/buttons/primary_button.dart';
import 'package:home_camper_host/signup/bloc/signup_bloc.dart';
import 'package:home_camper_host/signup/bloc/signup_events.dart';
import 'package:home_camper_host/signup/bloc/signup_states.dart';
import 'package:home_camper_host/signup/constants/signup_constants.dart';
import 'package:home_camper_host/signup/validation/signup_validation.dart';
import 'package:home_camper_host/signup/widgets/pin_field.dart';

import 'package:pin_keyboard/pin_keyboard.dart';
import 'package:pin_keyboard/pin_keyboard_controller.dart';

class PinScreen extends StatelessWidget {
  const PinScreen({
    super.key,
    required this.coordinator,
  });

  final PinScreenNavigationDelegate coordinator;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            centerTitle: false,
            title: Text(
              "Create Passcode",
              textAlign: TextAlign.start,
              style: TextStyles.header,
            ),
          ),
          SliverFillRemaining(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: BlocSelector<SignupBloc, SignupState, String>(
                  bloc: BlocProvider.of<SignupBloc>(context),
                  selector: (state) => state.pin,
                  builder: (context, pin) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          "Make it 💪- Refrain from sequences (123456) and repeated numbers (111234)",
                          style: TextStyles.subtitle,
                        ),
                        const SizedBox(height: 42),
                        PinField(
                          pin: pin,
                          pinLength: SignupConstants.pinLength,
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        // showing the hardware keyboard was giving me focus node issues, so I opted for a pin pad widget instead
                        PinKeyboard(
                          controller: PinKeyboardController(),
                          length: SignupConstants.pinLength,
                          onChange: (value) {
                            if (value.length <= SignupConstants.pinLength) {
                              BlocProvider.of<SignupBloc>(context)
                                  .add(PinEvent(value));
                            }
                          },
                          onBiometric: () {},
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        PrimaryButton(
                          onPressed: () {
                            final String? errorMessage = validatePin(pin);
                            if (errorMessage != null) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('🚨 $errorMessage'),
                                ),
                              );
                            } else {
                              coordinator.onPinCreated();
                            }
                          },
                          text: "Confirm",
                        ),
                        const SizedBox(
                          height: 20,
                        )
                      ],
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}

mixin PinScreenNavigationDelegate {
  void onPinCreated();
}
