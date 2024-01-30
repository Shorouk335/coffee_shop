import 'package:coffee_shop/core/theme/dynamic_theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class TimeLineBuilderWidget extends StatelessWidget {
 const TimeLineBuilderWidget(
      {super.key,
      required this.states,
      required this.isLast,
      required this.isFirst, 
      required this.indicator
      });
 final String states;
 final bool isLast;
 final bool isFirst;
 final Widget indicator  ;

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: isFirst,
      isLast: isLast,
      beforeLineStyle: LineStyle(
        thickness: 2,
        color: AppColors.secondary,
      ),
      afterLineStyle: LineStyle(thickness: 2, color: AppColors.secondary),
      indicatorStyle: IndicatorStyle(
        indicator: indicator ,
        width: 20,
        color:AppColors.secondary ,
        indicatorXY: 0.4,
        padding: EdgeInsets.symmetric(horizontal: 8.0),
      ),
      hasIndicator: true,     
      alignment: TimelineAlign.manual,
      lineXY: 0.1,
      endChild: Padding(
          padding: const EdgeInsets.only(
            left: 10 , bottom: 20
          ), child: Text(states , style: TextStyle(fontSize: 18.0),)),
    );
  }
}
