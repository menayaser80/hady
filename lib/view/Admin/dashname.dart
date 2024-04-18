import 'package:flutter/material.dart';
import 'package:lava/view/widget/title%20widget.dart';
import 'package:shimmer/shimmer.dart';

class DashNameTextWidget extends StatelessWidget {
  const DashNameTextWidget({super.key, this.fontSize = 30});
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(seconds: 22),
      baseColor: Colors.purple,
      highlightColor: Colors.red,
      child: TitlesTextWidget(
        label: "Dashboard Screen",
        fontSize: fontSize,
      ),
    );
  }
}