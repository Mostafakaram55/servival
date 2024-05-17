
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/resourses/color_manager/color_light.dart';
class CustomButtonNavigationBar extends StatelessWidget {
  CustomButtonNavigationBar({super.key});

  final List<String>items = [
    'assets/images/Donate.png',
    'assets/images/Recieve.png',
    'assets/images/track.png',
    'assets/images/exploer.png',
    'assets/images/icons8-person-50.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Container(
          height: 56.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24.r),
              color: ColorManager.buttonColor,
              boxShadow: [
                BoxShadow(
                  color: ColorManager.buttonColor.withOpacity(0.3),
                  offset: const Offset(0, 20),
                  blurRadius: 20.r,
                ),
              ]
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(items.length, (index) =>
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      height: 36.h,
                      width: 36.w,
                      child: Image.asset(
                          items[index],
                        color: Colors.white,
                      ),
                    ),
                  ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
