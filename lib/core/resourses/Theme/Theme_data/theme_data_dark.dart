
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:servival/core/resourses/font_manager.dart';
import '../../color_manager/color_dark.dart';
import '../../color_manager/color_light.dart';
import '../../text_style_manager.dart';
dynamic getThemeDataDark()=>ThemeData(
  scaffoldBackgroundColor:ColorManagerDark.primary ,
  disabledColor: ColorManagerDark.textColor,
  backgroundColor: ColorManagerDark.buttonNavigationBarIcon,
  splashColor: ColorManagerDark.lightGrayOver,
  cardColor: ColorManagerDark.secondColor,
  primaryColor: ColorManagerDark.primary,
  buttonTheme: ButtonThemeData(
    buttonColor: ColorManagerDark.buttonColor,
    splashColor: ColorManagerDark.buttonColor,
  ),
  bottomNavigationBarTheme:BottomNavigationBarThemeData(
    backgroundColor: ColorManagerDark.buttonNavigationBarIcon,
    elevation: 20,
    selectedItemColor:ColorManagerDark.buttonColor,
    unselectedItemColor:ColorManagerDark.lightGrayOver,
  ),


  datePickerTheme: DatePickerThemeData(

    headerForegroundColor: Colors.white,
    backgroundColor: ColorManagerDark.primary,
    todayBackgroundColor: MaterialStateProperty.all<Color>(ColorManager.buttonColor),
    todayForegroundColor:MaterialStateProperty.all<Color>(Colors.white) ,
  dayForegroundColor:MaterialStateProperty.all<Color>(Colors.white) ,
 weekdayStyle: TextStyle(
   color: Colors.white,
   fontSize: 22.sp,
   fontWeight: FontWeight.bold
 ),

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
              color: Colors.white
          )
      ),
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: const BorderSide(
              color: Colors.white
          )
      ),
      fillColor:Colors.black26,
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
        color: Colors.white
    ),
    confirmButtonStyle:ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Set text color
      padding: MaterialStateProperty.all<EdgeInsets>( EdgeInsets.only(bottom: 10.h)), // Set padding
      textStyle: MaterialStateProperty.all<TextStyle>( TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,

      )),
    ) ,
    cancelButtonStyle:  ButtonStyle(
      foregroundColor: MaterialStateProperty.all<Color>(Colors.white), // Set text color
      padding: MaterialStateProperty.all<EdgeInsets>( EdgeInsets.only(bottom: 10.h)), // Set padding
      textStyle: MaterialStateProperty.all<TextStyle>( TextStyle(
        fontSize: 20.sp,
        fontWeight: FontWeight.w400,
      )),
    ),


  ),
  textTheme:TextTheme(
    headlineLarge: getLightStyle(color: ColorManagerDark.textColor,fontSize:FontSize.s22.sp),
    displayLarge: getBoldStyle(color: ColorManagerDark.lightGrayOver,fontSize: FontSize.s20.sp),
    titleMedium: getMediumStyle(color:ColorManagerDark.textColor,fontSize: FontSize.s16.sp),
    headlineMedium:getMediumStyle(color:ColorManagerDark.secondTextColor,fontSize: FontSize.s14.sp),
      bodyLarge: getRegularStyle(color: ColorManagerDark.buttonNavigationBarIcon,fontSize: FontSize.s25.sp),
    bodySmall: getRegularStyle(color:ColorManagerDark.gray),
    labelMedium: getMediumStyle(color:ColorManagerDark.textColor,fontSize: FontSize.s12.sp),
    titleSmall:getSemiBoldStyle(color: ColorManagerDark.textColor,fontSize: FontSize.s12.sp),
      labelLarge: getSemiBoldTextStyle(color: ColorManagerDark.textColor,fontSize: FontSize.s40.sp)
  ),
);