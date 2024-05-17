
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resourses/font_manager.dart';
import '../../../../core/resourses/icons_app.dart';

import '../../../../core/resourses/text_style_manager.dart';
import '../../../../core/resourses/widgets/custom_text.dart';
import '../../../../core/resourses/widgets/custom_text_form_filed.dart';

class ProfileItemForm extends StatelessWidget {
  const ProfileItemForm({
    super.key,
    required this.title,
    required this.dataForm,
    required this.textEditingController
  });
final String title;
final String dataForm;
final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextApp(
            text: title,
            textTheme:getBoldStyle(
              color:Theme.of(context).disabledColor,
              fontSize: FontSize.s18.sp,
            )
        ),
        SizedBox(height: 10.h,),
        CustomTextFormFiled(
            readOnly: true,
            hintText: dataForm,
            colorHintText: Colors.grey,
            icon: IconBroken.Profile,
            textEditingController: textEditingController,
            textInputType: TextInputType.text
        ),
      ],
    );
  }
}
