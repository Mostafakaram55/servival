
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:servival/core/resourses/color_manager/color_light.dart';
import 'package:servival/core/resourses/text_style_manager.dart';
import 'package:servival/fetures/RecieveView/presentation/widgets/receive_list_view.dart';
import '../../../../core/resourses/font_manager.dart';
import '../../../../core/resourses/widgets/custom_text.dart';


class RecieveViewBody extends StatelessWidget {
  const RecieveViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  const CustomScrollView(
      slivers: [
        // SliverAppBar(
        //   expandedHeight: 40.h,
        //   backgroundColor: ColorManager.buttonColor,
        //   title:CustomTextApp(
        //     textTheme: getBoldStyle(color:Colors.white,fontSize: FontSize.s25.sp),
        //     text: 'Receive View',
        //   ),
        //   centerTitle: true,
        // ),
         SliverToBoxAdapter(
          child:ReceiveListView(),
        ),
      ],
    );
  }
}
