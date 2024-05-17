
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:servival/fetures/Auth_view/presentation/view-model/states/sign_ups_states.dart';

import '../../../../core/resourses/color_manager/color_light.dart';
import '../../../../core/resourses/icons_app.dart';
import '../view-model/cubits/sign_up_cubits.dart';

class DropDownButton extends StatefulWidget {
  const DropDownButton({super.key});

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<SignUpCubit,SignUpStates>(
      builder: (context,state){
        return  DropdownButtonHideUnderline(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: DropdownButton<String>(
              dropdownColor: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(15.r),
              icon: Icon(
                IconBroken.Arrow___Down_Circle,
                color: ColorManager.buttonColor,
              ),
              iconSize: 30.sp,
              isExpanded: true,
              hint: Text(
                'Select blood type',
                style: TextStyle(
                  fontSize: 17.sp,
                  color: Colors.grey,
                ),
              ),
              items:context.read<SignUpCubit>().items.map((String item) => DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style:  TextStyle(
                    fontSize: 17.sp,
                  ),
                ),
              )).toList(),
              value: context.read<SignUpCubit>().selectedValue,
              onChanged: (String? value) {
                context.read<SignUpCubit>().selectValue(value!);
              },
            ),
          ),
        );
      },
    );
  }
}
