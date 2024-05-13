import 'package:effective_mobile_test/core/resources/app_colors.dart';
import 'package:effective_mobile_test/core/resources/app_fonts.dart';
import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  final Function()? onPressed;
  final String title;
  final Color color;
  const MainButton({
    super.key,
    this.onPressed,
    required this.title,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 42,
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          backgroundColor: color,
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: AppFonts.s16w600.copyWith(
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}
