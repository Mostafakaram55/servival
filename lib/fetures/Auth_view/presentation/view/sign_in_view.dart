
import 'package:flutter/material.dart';
import 'package:servival/fetures/Auth_view/presentation/widgets/sign_in_view_body.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: const SignInViewBody(),
    );
  }
}
