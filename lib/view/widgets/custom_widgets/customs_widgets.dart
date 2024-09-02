import 'package:crm_mrs_app/constant.dart';
import 'package:crm_mrs_app/model/resources/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

Widget buildShimmerIcon({
  required updatedAreaList,
  required onPressed,
}) {
  return GestureDetector(
    onTap: onPressed,
    child: Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: AppSize.s40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: updatedAreaList ? appcolor : applightcolor, // bg color
          ),
          child: Center(
            child: Icon(
              Icons.add_location_alt_outlined,
              size: AppSize.s30,
              color: dfColor, // Change the color as needed
            ),
          ),
        ),
        if (updatedAreaList) //control shimmer effect
          Shimmer.fromColors(
            period: Duration(milliseconds: 2000),
            baseColor: Colors.transparent,
            highlightColor: Colors.white70,
            child: Container(
              alignment: Alignment.center,
              width: AppSize.s40,
              height: AppSize.s40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(75), // Adjust as needed
                color: Colors.white, // Adjust as needed
              ),
            ),
          ),
      ],
    ),
  );
}

Widget buildAnimatedIcon() {
  return AnimatedIcon(
    icon: AnimatedIcons.view_list,
    progress: AlwaysStoppedAnimation(.48), // Adjust the progress as needed
    size: 30,
    color: appcolor,
  );
}

class ShimmerWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: EdgeInsets.all(10),
        width: double.infinity,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
