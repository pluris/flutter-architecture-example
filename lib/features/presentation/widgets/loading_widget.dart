import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final double? width, height;
  const LoadingWidget({super.key, this.width, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(10.0)),
    );
  }
}
