import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "images/dashboard.svg",
          semanticsLabel: 'A red up arrow',
          width: 100,
          height: 100,
        ),
      ],
    );
  }
}
