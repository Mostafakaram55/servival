
import 'package:flutter/material.dart';
import 'package:servival/core/resourses/color_manager/color_light.dart';

import '../widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: ColorManager.buttonColor,
      body:const SplashViewBody() ,
    );
  }
}
