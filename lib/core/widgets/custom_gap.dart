import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';

class CustomGap extends StatelessWidget {
  const CustomGap(this.value,{super.key});
  final double value;
  @override
  Widget build(BuildContext context) {
    return Gap(value);
  }
}
