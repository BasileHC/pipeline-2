import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexagon/hexagon.dart';
import 'package:home_camper_gallery/theme/text_styles.dart';
import 'package:home_camper_gallery/widgets/buttons/primary_button.dart';
import 'package:home_camper_gallery/widgets/buttons/secondary_button.dart';
import 'package:home_camper_traveler/signup/bloc/signup_bloc.dart';
import 'package:home_camper_traveler/signup/bloc/signup_events.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.coordinator,
  });

  final ProfileScreenNavigationDelegate coordinator;

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<SignupBloc>(context);
    return Scaffold(
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverFillRemaining(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  const SafeArea(
                    child: SizedBox(
                      height: 40,
                    ),
                  ),
                  // I couldn't get the SVG from Figma, so this is just a workaround
                  HexagonWidget.flat(
                    width: 150,
                    elevation: 0,
                    cornerRadius: 20,
                    child: const Image(
                        width: 200,
                        image: AssetImage('assets/profile.png'),
                        fit: BoxFit.fill),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    bloc.state.name,
                    style: TextStyles.header,
                  ),
                  Text(
                    bloc.state.email,
                    style: TextStyles.label,
                  ),
                  const Spacer(),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: SecondaryButton(
                          onPressed: () {
                            bloc.add(ClearEvent());
                            coordinator.onLogout();
                          },
                          text: "Clear account",
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: PrimaryButton(
                          onPressed: () {
                            coordinator.onLogout();
                          },
                          text: "Log out",
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

mixin ProfileScreenNavigationDelegate {
  void onLogout();
}
