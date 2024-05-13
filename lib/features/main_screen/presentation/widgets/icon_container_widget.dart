import 'dart:ui';

import 'package:effective_mobile_test/core/resources/app_colors.dart';
import 'package:effective_mobile_test/core/resources/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class IconContainer extends StatelessWidget {
  final Color color;
  final String image;
  final Function()? onTap;
  final String title;

  const IconContainer({
    super.key,
    required this.color,
    required this.image,
    required this.onTap,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(8),
            ),
            child: SvgPicture.asset(
              image,
              fit: BoxFit.none,
            ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          textAlign: TextAlign.center,
          style: AppFonts.s14w400.copyWith(color: AppColors.white),
        ),
      ],
    );
  }
}
