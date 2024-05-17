

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../font_manager.dart';
import '../icons_app.dart';

class CustomDropDownButtonFormFiled extends StatelessWidget {
  const CustomDropDownButtonFormFiled({super.key ,
    required this.validator,
     required this.title,
     required this.listValue,
     required this.onChange
   });
 final String title;
 final List<String> listValue;
 final  Function(dynamic value) onChange;
 final String? Function(String? value) validator;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      borderRadius: BorderRadius.circular(15.r),
      isExpanded: true,
      isDense: true,
      validator: validator,
      style: TextStyle(
          fontSize: FontSize.s16.sp,
          color: Theme.of(context).disabledColor
      ),
      dropdownColor: Theme.of(context).cardColor,
      iconDisabledColor: Theme.of(context).cardColor,
      hint:Text(
        title,
        maxLines: 2,
        style: TextStyle(
            color: Colors.grey,
            fontSize: 16.sp,
         overflow: TextOverflow.ellipsis,
            fontWeight: FontWeight.w500
        ),
      ),
      iconSize: 25.sp,
      icon:  Icon(
        IconBroken.Arrow___Down_2,
        color: Theme.of(context).disabledColor,
      ),
      decoration: InputDecoration(
        errorBorder:   OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.r),
          borderSide: const BorderSide(
            color: Colors.red,
            strokeAlign: 1,
            width: 1,
          )
        ),
        filled: true,
        fillColor: Theme.of(context).cardColor,
        border:OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.r),
            borderSide: BorderSide.none
        ),
      ),

      items:listValue.map((e){
        return  DropdownMenuItem(
          value: e,
          child: Text(
            e,
            style:  TextStyle(
                color:Colors.grey,
                fontSize: FontSize.s18.sp,
                fontWeight: FontWeight.w500
            ),
          ),
        );
      }
      ).toList(),
      onChanged: onChange,
    );
  }
}

