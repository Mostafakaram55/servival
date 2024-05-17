
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:servival/core/resourses/color_manager/color_light.dart';
import '../font_manager.dart';
class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key,
    required this.hintText,
    required this.colorHintText,
    required this.icon, required
    this.textEditingController,
    required this.textInputType,
    this.suffixIcon,
    this.obscureTextValue,
    this.maxLines,
    this.readOnly,
     this.validate,
  });
final String hintText;
final Color colorHintText;
final IconData icon;
  final  TextInputType textInputType;
 final TextEditingController textEditingController;
  final Widget?suffixIcon;
  final bool? obscureTextValue;
  final int? maxLines;
  final bool? readOnly;
  final String? Function(String?)? validate;
  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      validator:validate,
      readOnly: readOnly??false,
      maxLines: maxLines,
      minLines:1,
      obscureText:obscureTextValue ??false,
      keyboardType:textInputType ,
      cursorColor: ColorManager.buttonColor,
      controller: textEditingController,
      style: TextStyle(
        fontSize: FontSize.s16.sp,
        color: Theme.of(context).disabledColor,
        fontWeight: FontWeight.w500
      ),
      decoration: InputDecoration(
        isDense: true,
        hintText:hintText ,
      hintStyle: TextStyle(
        color: colorHintText,
        fontSize: FontSize.s15.sp
      ),
      prefixIcon:Icon(
          icon,
        color: Theme.of(context).disabledColor,
        size: 25.sp,
      ) ,
      suffixIcon:suffixIcon ,
      border:OutlineInputBorder(
        borderRadius: BorderRadius.circular(15.r),
        borderSide: BorderSide.none
      ),
        filled: true,
          fillColor: Theme.of(context).cardColor,
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color:ColorManager.error, width: 1.w),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color: Theme.of(context).disabledColor, width: 1.w),
        ),
        focusedErrorBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: BorderSide(color:ColorManager.error, width: 1.w),
        ),
      ),
      );
  }
}
