
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:servival/core/resourses/font_manager.dart';
import 'package:servival/core/resourses/text_style_manager.dart';
import 'package:servival/core/resourses/widgets/custom_text.dart';

import '../../../../core/Di/serviceLocator.dart';
import '../../../../core/resourses/icons_app.dart';
import '../../../Auth_view/presentation/widgets/custom_buttom.dart';
import '../view_model/cubits/donation_cubits/request_donation_cubit.dart';
import '../widgets/donation_request_form_filed.dart';
class DonationRequestView extends StatelessWidget {
  const DonationRequestView({super.key});

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
      child:  Padding(
        padding:  EdgeInsets.fromLTRB(16.w,20.h,16.w,16.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  icon:  Icon(
                    IconBroken.Arrow___Left,
                    color: Theme.of(context).disabledColor,
                  )
              ),
              Center(
                child: CustomTextApp(
                    text: 'Donation Request',
                    textTheme: getBoldStyle(
                        color: Theme.of(context).disabledColor,
                      fontSize: FontSize.s20.sp
                    )
                ),
              ),
              SizedBox(height: 20.h,),
              CustomTextApp(
                  text: 'Fill in all gaps to send your request successfully ',
                  textTheme: getRegularStyle(
                      color: Colors.grey,
                      fontSize: FontSize.s16.sp
                  )
              ),
              SizedBox(height: 20.h,),
              DonationRequestForms(),
          ],),
        ),
      ),
    );
  }
}
