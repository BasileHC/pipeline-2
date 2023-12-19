import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_camper_gallery/theme/text_styles.dart';
import 'package:home_camper_gallery/widgets/buttons/primary_button.dart';
import 'package:home_camper_traveler/signup/bloc/signup_bloc.dart';
import 'package:home_camper_traveler/signup/bloc/signup_events.dart';
import 'package:home_camper_traveler/signup/bloc/signup_states.dart';
import 'package:home_camper_traveler/signup/validation/signup_validation.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({
    super.key,
    required this.coordinator,
  });

  final SignupScreenNavigationDelegate coordinator;
  final GlobalKey _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SignupBloc>(context);

    final nameController = TextEditingController(text: bloc.state.name);
    final emailController = TextEditingController(text: bloc.state.email);

    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            centerTitle: false,
            title: Text(
              "Create account",
              textAlign: TextAlign.start,
              style: TextStyles.header,
            ),
          ),
          SliverFillRemaining(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: BlocProvider(
                  create: (context) => SignupBloc(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      const SizedBox(
                        height: 20,
                      ),
                      BlocConsumer<SignupBloc, SignupState>(
                        bloc: BlocProvider.of<SignupBloc>(context),
                        listener: (context, state) {
                          nameController.text = state.name;
                          emailController.text = state.email;
                        },
                        builder: (context, pin) => Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              "Name",
                              style: TextStyles.label,
                            ),
                            TextFormField(
                              controller: nameController,
                              keyboardType: TextInputType.name,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: validateName,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "Email",
                              style: TextStyles.label,
                            ),
                            TextFormField(
                              controller: emailController,
                              keyboardType: TextInputType.emailAddress,
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              validator: validateEmail,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Spacer(),
                      PrimaryButton(
                        onPressed: () {
                          final String? errorMessage =
                              validateName(nameController.text) ??
                                  validateEmail(emailController.text);

                          if (errorMessage != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    "Please fix the errors in the fields above"),
                              ),
                            );
                          } else {
                            bloc.add(
                              PersonalDetailsEvent(
                                nameController.text,
                                emailController.text,
                              ),
                            );
                            coordinator.onDetailsEntered();
                          }
                        },
                        text: "Next",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

mixin SignupScreenNavigationDelegate {
  void onDetailsEntered();
}
