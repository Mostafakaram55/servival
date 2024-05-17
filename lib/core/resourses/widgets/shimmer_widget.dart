
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerContainerEffect extends StatelessWidget {
  ShimmerContainerEffect(
      {Key? key, required this.width,
        required this.height,
        required this.borderRadius
      })
      : super(key: key);
  double? width;
  double? height;
  double? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor:  Colors.grey.withOpacity(0.8),
      highlightColor: Colors.white,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Theme
              .of(context)
              .disabledColor,
          borderRadius: BorderRadius.circular(borderRadius ?? 8.0),
        ),
      ),
    );
  }
}