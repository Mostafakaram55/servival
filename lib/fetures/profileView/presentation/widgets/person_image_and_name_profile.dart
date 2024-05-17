
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/resourses/color_manager/color_light.dart';
import '../../../../core/resourses/font_manager.dart';
import '../../../../core/resourses/navigation_manager.dart';
import '../../../../core/resourses/text_style_manager.dart';
import '../../../../core/resourses/widgets/custom_text.dart';

class ImageAndNameProfile extends StatelessWidget {
  const ImageAndNameProfile({super.key, required this.name, required this.email});
final String name;
final String email;
  @override
  Widget build(BuildContext context) {
    return  IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 7/7,
            child: ClipRRect(
              borderRadius:BorderRadius.circular(12.r),
              child: Image.asset(
                  'assets/images/icons8-admin-settings-male-100.png',
                fit: BoxFit.cover,
              ),
            )
          ),
          SizedBox(width: 15.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextApp(
                text: name,
                textTheme: getRegularStyle(
                  color: Colors.blueGrey,
                  fontSize: FontSize.s20.sp,
                ),
              ),
              SizedBox(height: 10.h,),
              CustomTextApp(
                  text: email,
                  textTheme: getMediumStyle(
                      color:Colors.grey,
                      fontSize: FontSize.s14.sp
                  )
              ),
              SizedBox(height: 10.h,),
              GestureDetector(
                onTap: (){
                Navigator.pushNamed(context, NameRout.editeProfileView);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius:BorderRadius.circular(12.r),
                    color: Theme.of(context).scaffoldBackgroundColor,
                    border: Border.all(
                      color: ColorManager.buttonColor,
                      width: 0.4,
                    ),
                  ),
                  child: Padding(
                    padding:  EdgeInsets.all(8.0.sp),
                    child: Text(
                      'Edit profile',
                      style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: Theme.of(context).disabledColor
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
