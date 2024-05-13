import 'package:effective_mobile_test/core/resources/app_colors.dart';
import 'package:effective_mobile_test/core/resources/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateButton extends StatelessWidget {
  const DateButton({
    super.key,
    this.date,
    required this.onPressed,
  });

  final DateTime? date;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.blue,
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: date == null
            ? const Icon(
                Icons.add,
                color: AppColors.white,
              )
            : Text(
                DateFormat.MMMMEEEEd().format(
                  date ?? DateTime.now(),
                ),
                style: AppFonts.s14w400.copyWith(
                  color: AppColors.white,
                ),
              ),
      ),
    );
  }
}
