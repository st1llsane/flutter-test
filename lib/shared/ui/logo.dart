import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Logo extends StatelessWidget {
  final double? height;

  const Logo({
    super.key,
    this.height = 80,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'lib/assets/logo.svg',
      semanticsLabel: 'Logo',
      height: height,
    );
  }
}
