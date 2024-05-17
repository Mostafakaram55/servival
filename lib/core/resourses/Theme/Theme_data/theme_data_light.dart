
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../color_manager/color_light.dart';
import '../../font_manager.dart';
import '../../text_style_manager.dart';
ThemeData getThemeDataLight()=>ThemeData(
  scaffoldBackgroundColor:ColorManager.primary ,
  disabledColor: ColorManager.black,
  backgroundColor: ColorManager.secondColor,
  splashColor: ColorManager.descriptionColor,
  primaryColor: ColorManager.primary,
  cardColor: ColorManager.secondTextColor,
  buttonTheme: ButtonThemeData(
    buttonColor: ColorManager.buttonColor,
    splashColor: ColorManager.buttonColor,
  ),
  bottomNavigationBarTheme:BottomNavigationBarThemeData(
    backgroundColor: ColorManager.primary,
    elevation: 20,
    selectedItemColor:ColorManager.buttonColor,
    unselectedItemColor:ColorManager.gray,
  ),


datePickerTheme: DatePickerThemeData(
  headerForegroundColor: Colors.white,
 backgroundColor: Colors.white,
todayBackgroundColor: MaterialStateProperty.all<Color>(ColorManager.buttonColor),
 todayForegroundColor:MaterialStateProperty.all<Color>(Colors.white) ,

 inputDecorationTheme:  InputDecorationTheme(

labelStyle: TextStyle(
  fontSize: 18.sp,
  color: Colors.blueGrey,
),
   hintStyle: TextStyle(
     fontSize: 18.sp,
     color:Colors.grey,
   ),
   focusedBorder:OutlineInputBorder(
       borderRadius: BorderRadius.circular(15.r),
       borderSide: const BorderSide(
           color: Colors.black
       )
   ),
   border: OutlineInputBorder(
     borderRadius: BorderRadius.circular(15.r),
     borderSide: const BorderSide(
       color: Colors.black
     )
   ),
   fillColor:Colors.white,
   filled: true,
   contentPadding:  EdgeInsets.all(5.sp),

 ),
  headerBackgroundColor: ColorManager.buttonColor,
  elevation: 9,
  headerHeadlineStyle: TextStyle(
    fontSize: 19.sp,
  ),
  headerHelpStyle:TextStyle(
    fontSize: 25.sp,
    fontWeight: FontWeight.bold,
  ) ,
dayStyle: TextStyle(
  fontSize: FontSize.s20.sp,
  color: Colors.black
),
confirmButtonStyle:ButtonStyle(
  foregroundColor: MaterialStateProperty.all<Color>(Colors.black), // Set text color
  padding: MaterialStateProperty.all<EdgeInsets>( EdgeInsets.only(bottom: 10.h)), // Set padding
  textStyle: MaterialStateProperty.all<TextStyle>( TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,

  )),
) ,
  cancelButtonStyle:  ButtonStyle(
foregroundColor: MaterialStateProperty.all<Color>(Colors.black), // Set text color
padding: MaterialStateProperty.all<EdgeInsets>( EdgeInsets.only(bottom: 10.h)), // Set padding
textStyle: MaterialStateProperty.all<TextStyle>( TextStyle(
    fontSize: 20.sp,
  fontWeight: FontWeight.w400,
)),
),


),
  textTheme: TextTheme(
    headlineLarge: getLightStyle(color: ColorManager.textProfile,fontSize:FontSize.s22.sp),
    displayLarge: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s20.sp),
    titleMedium: getMediumStyle(color:ColorManager.gray,fontSize: FontSize.s20.sp),
    headlineMedium:getMediumStyle(color:ColorManager.darkGray,fontSize: FontSize.s14.sp),
    bodyLarge: getRegularStyle(color: ColorManager.buttonColor,fontSize: FontSize.s25.sp),
    bodySmall: getRegularStyle(color:ColorManager.gray,fontSize: FontSize.s20.sp),
    labelMedium: getMediumStyle(color:ColorManager.black,fontSize: FontSize.s12.sp),
    titleSmall:getSemiBoldStyle(color: ColorManager.black,fontSize: FontSize.s12.sp),
    labelLarge: getSemiBoldTextStyle(color: ColorManager.black,fontSize: FontSize.s40.sp)
  ),
);