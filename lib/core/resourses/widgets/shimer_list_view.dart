
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:servival/core/resourses/widgets/shimmer_widget.dart';

class ShimmerListView extends StatelessWidget {
  const ShimmerListView({super.key, required this.itemCount});
final int itemCount;
  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.all(20),
          child: ShimmerContainerEffect(
            height: 100.h,
            borderRadius: 15.r,
            width: double.infinity,
          ),
        ),
        separatorBuilder: (context, index) => SizedBox(height: 10.h,),
        itemCount: itemCount,
    );
  }
}
