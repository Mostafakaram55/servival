
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:servival/core/resourses/color_manager/color_light.dart';
import 'package:servival/core/resourses/font_manager.dart';
import 'package:servival/core/resourses/text_style_manager.dart';
import 'package:servival/core/resourses/widgets/custom_text.dart';
import 'package:servival/fetures/profileView/presentation/viewModel/profile_cubit.dart';
import '../../../fetures/RecieveView/presentation/viewModel/cubit/Receive_Blood_Request_cubit.dart';
import '../../../fetures/donateView/data/model/donation_model.dart';
import '../icons_app.dart';
import '../network/change_app_mode.dart';
import '../network/open_linl.dart';

class UserItem extends StatelessWidget {
   const UserItem({super.key,required this.donationModel});
  final DonationModel donationModel;

  @override
  Widget build(BuildContext context) {
    DateTime parsedDateTime = DateTime.parse(donationModel.dataTime!);
    return Padding(
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
                            text: '${donationModel.name}',
                            textTheme:getBoldStyle(
                            color:Theme.of(context).disabledColor,
                            fontSize: FontSize.s18.sp)) ,
                        const Spacer(),
                        CustomTextApp(
                            text: '${donationModel.bloodType}',
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
                          size: 20.sp,
                        ),
                        SizedBox(width:5.w,),
                        CustomTextApp(
                            text: '${donationModel.location}',
                            textTheme:getLightStyle(
                            color:Colors.grey,
                            fontSize: FontSize.s16.sp
                        )),
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
                           donationModel.dataTime==null?'0':DateFormat.yMMMd().format(parsedDateTime),
                          style:TextStyle(
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
    );
  }
}
