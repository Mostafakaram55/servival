
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../core/resourses/color_manager/color_light.dart';
import '../../../../core/resourses/font_manager.dart';
import '../../../../core/resourses/icons_app.dart';
import '../../../../core/resourses/network/change_app_mode.dart';
import '../../../../core/resourses/network/open_linl.dart';
import '../../../../core/resourses/text_style_manager.dart';
import '../../../../core/resourses/widgets/custom_text.dart';
import '../../../profileView/presentation/viewModel/profile_cubit.dart';
import '../../data/models/Receive_Blood_Request_model.dart';

class ReceiveBloodRequestItem extends StatelessWidget {
  const ReceiveBloodRequestItem({super.key,required this.receiveBloodModel});
final  ReceiveBloodModel receiveBloodModel;
  @override
  Widget build(BuildContext context) {
    DateTime parsedDateTime = DateTime.parse(receiveBloodModel.dataTime);
    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 15.w,vertical: 5.h),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.r),
          color: Theme.of(context).cardColor,
        ),
        child: Padding(
          padding:  EdgeInsets.all(15.r),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 40.w,
                height: 40.h,
                decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    image:  DecorationImage(
                        image:context.read<ChangMode>().isDark?const AssetImage('assets/images/light_person.png'):
                        const AssetImage('assets/images/black_person.png'),
                        fit: BoxFit.cover
                    )
                ),
              ),
              SizedBox(width: 10.w,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children:[
                        CustomTextApp(
                            text: '${receiveBloodModel.name}',
                            textTheme:getBoldStyle(
                                color:Theme.of(context).disabledColor,
                                fontSize: FontSize.s18.sp)) ,
                        const Spacer(),
                        CustomTextApp(
                            text: receiveBloodModel.bloodType,
                            textTheme: getSemiBoldStyle(
                                color: ColorManager.buttonColor,
                                fontSize: FontSize.s25.sp
                            )),
                      ],
                    ),
                    SizedBox(height: 7.h,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Icon(
                          Icons.location_on,
                          color: ColorManager.buttonColor,
                          size: 18.sp,
                        ),
                        SizedBox(width: 8.w,),
                        CustomTextApp(
                            text: receiveBloodModel.patientLocation,
                            textTheme:getLightStyle(
                                color:Colors.grey,
                                fontSize: FontSize.s16.sp
                            )),

                      ],
                    ),
                    SizedBox(height: 7.h,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          'assets/images/icons8-syringe-64.png',
                          fit: BoxFit.cover,
                          height:24.h,
                          width: 24.w,
                        ),
                        SizedBox(width: 5.h,),
                        CustomTextApp(
                            text: '${receiveBloodModel.bagsNumber}',
                            textTheme:getLightStyle(
                                color:Colors.grey,
                                fontSize: FontSize.s16.sp
                            )),
                        SizedBox(width: 8.w,),
                      ],
                    ),
                    SizedBox(height: 7.h,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(
                          Icons.date_range_outlined,
                          color: ColorManager.buttonColor,
                          size: 20.sp,
                        ),
                        SizedBox(width: 5.h,),
                        Text(
                          DateFormat.yMMMd().format(parsedDateTime) ,
                          style: TextStyle(
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w300,
                              color: Colors.blueGrey
                          ),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: (){
                            openLink('https://wa.me/+20${context.read<ProfileCubit>().userModel!.phone}');
                          },
                          child: CircleAvatar(
                            backgroundColor: ColorManager.buttonColor.withOpacity(0.2),
                            radius: 15.r,
                            child: Icon(
                              IconBroken.Send,
                              color: ColorManager.buttonColor,
                              size: 20.sp,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w,),
                        GestureDetector(
                          onTap: (){
                            makePhoneCall('+2${context.read<ProfileCubit>().userModel!.phone}');
                          },
                          child: CircleAvatar(
                            backgroundColor: ColorManager.buttonColor.withOpacity(0.2),
                            radius: 15.r,
                            child: Icon(
                              IconBroken.Call,
                              color: ColorManager.buttonColor,
                              size: 20.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ) ;
  }
}
