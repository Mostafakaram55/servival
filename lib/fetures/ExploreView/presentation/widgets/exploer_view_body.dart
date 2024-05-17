
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../model/list.dart';
import 'explore_item.dart';

class ExploreViewBody extends StatelessWidget {
  const ExploreViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return  ListView.separated(
        itemBuilder: (context, index) =>ExploreItem(
          aText: akList[index],
          qText:qList[index] ,
        ),
        separatorBuilder: (context, index) => SizedBox(height: 10.h,),
        itemCount: qList.length
    );
  }
}
