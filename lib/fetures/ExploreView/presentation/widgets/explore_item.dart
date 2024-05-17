
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:servival/core/resourses/text_style_manager.dart';
import 'package:servival/core/resourses/widgets/custom_text.dart';

class ExploreItem extends StatelessWidget {
  const ExploreItem({super.key, required this.qText, required this.aText});
final String qText;
final String aText;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomTextApp(
                text: 'Q: $aText',
                textTheme: getSemiBoldStyle(
                    color: Theme.of(context).disabledColor,
                  fontSize: 18.sp
                )
            ),
            SizedBox(height: 5.h,),
             Divider(
              color: Colors.blueGrey,
              height: 1.h,
              thickness: 0.7,
            ),
            SizedBox(height: 5.h,),
            CustomTextApp(
                text: 'A: $qText',
                textTheme: getSemiBoldStyle(
                    color: Colors.grey,
                    fontSize: 16.sp
                )
            ),
          ],
        ),
      ),
    );
  }
}
