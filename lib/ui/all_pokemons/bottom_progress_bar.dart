import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class BottomProgressBar extends StatelessWidget {
  final bool isLoading;
  const BottomProgressBar({
    Key? key,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isLoading,
      child: SizedBox(
        height: 50,
        width: context.screenWidth,
        child: const CircularProgressIndicator().centered(),
      ),
    );
  }
}
