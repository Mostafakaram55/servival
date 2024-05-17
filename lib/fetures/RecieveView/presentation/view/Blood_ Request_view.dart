
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resourses/font_manager.dart';
import '../../../../core/resourses/text_style_manager.dart';
import '../../../../core/resourses/widgets/custom_text.dart';
import '../../../Auth_view/presentation/widgets/custom_buttom.dart';
import '../widgets/recieve_form_filed.dart';

class BloodRequestView extends StatelessWidget {
  const BloodRequestView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.r),
            topRight: Radius.circular(12.r),
          )
      ),
      child: Padding(
        padding:  EdgeInsets.fromLTRB(16.w,50.h,16.w,16.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: CustomTextApp(
                    text: 'Blood Request',
                    textTheme: getBoldStyle(
                        color: Theme.of(context).disabledColor,
                        fontSize: FontSize.s20.sp
                    )
                ),
              ),
              SizedBox(height: 20.h,),
              CustomTextApp(
                  text: 'Fill in all gaps to send your request successfully.',
                  textTheme: getRegularStyle(
                      color: Colors.grey,
                      fontSize: FontSize.s16.sp
                  )
              ),
              const RecieveFormFiled(),
            ],
          ),
        ),
      ),
    );
  }
}
