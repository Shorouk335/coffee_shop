
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';

class DotLineWidget extends StatelessWidget {
  const DotLineWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const DottedLine(
      direction: Axis.horizontal,
      lineLength: double.infinity,
      lineThickness: 2.0,
      dashLength: 2.0,
      dashColor: Colors.black38,
      dashRadius: 0.0,
      dashGapLength: 2.0,
      dashGapColor: Color.fromARGB(0, 15, 15, 15),
      dashGapRadius: 0.0,
    );
  }
}