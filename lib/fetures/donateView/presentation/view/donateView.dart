
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:servival/core/resourses/color_manager/color_light.dart';
import 'package:servival/core/resourses/icons_app.dart';
import 'package:servival/fetures/donateView/presentation/widgets/donate_view-body.dart';
import '../../../../core/resourses/font_manager.dart';
import '../../../../core/resourses/shimmer/shimmer_text.dart';



import 'Donation _Request_view.dart';

class DonateView extends StatefulWidget {
  const DonateView({super.key});

  @override
  State<DonateView> createState() => _DonateViewState();
}

class _DonateViewState extends State<DonateView> {

  @override
  Widget build(BuildContext context) {
    // DateTime date1=DateTime.now();
    // String? date2;
    // dynamic difference;
    // num? value;
    // if(RequestDonationCubit.get(context).postsForCurrentUser.isNotEmpty){
    //   date2 = RequestDonationCubit.get(context).postsForCurrentUser[RequestDonationCubit.get(context).postsForCurrentUser.length-1].dataTime;
    //   DateTime dateFinal = DateTime.parse(date2!);
    //   difference = date1.difference(dateFinal);
    //   value=120-difference.inDays;
    // }
    return  Scaffold(
      appBar: AppBar(
        centerTitle:true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title:  ShimmerText(
          size: FontSize.s25.sp,
          textTitle: 'Survival Net',
          baseColor:ColorManager.buttonColor,
          highlightColor:Theme.of(context).disabledColor,
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(40.h),
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Hallo, visitor',
                textAlign: TextAlign.center,
                style: GoogleFonts.notoSerif(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w600,
                    color:Theme.of(context).disabledColor
                ),
              ),
            ),
          ),
               ),
       ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context, builder: (context)=>const DonationRequestView());

         // if(value!<120){
         //   showModalBottomSheet(
         //       isScrollControlled: true,
         //       context: context, builder: (context)=>const DonationRequestView());
         // }else{
         //   Fluttertoast.showToast(
         //       msg: "you can’t donate until the 120 days pass",
         //       toastLength: Toast.LENGTH_SHORT,
         //       gravity: ToastGravity.TOP,
         //       timeInSecForIosWeb: 4,
         //       backgroundColor: Colors.green,
         //       textColor: Colors.white,
         //       fontSize: 20.sp
         //   );
         // }

         },
        backgroundColor: ColorManager.buttonColor,
        child: const Icon(
          IconBroken.Add_User,
          color: Colors.white,
        ),
      ),
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: const DonateViewBody(),
    );
  }
}
