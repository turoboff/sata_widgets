import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SwShimmer extends StatelessWidget {
  const SwShimmer({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: child,
    );
  }
}
