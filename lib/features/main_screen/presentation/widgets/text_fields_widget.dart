import 'package:effective_mobile_test/core/resources/app_colors.dart';
import 'package:effective_mobile_test/core/resources/app_fonts.dart';
import 'package:flutter/material.dart';

class TextFieldsContainer extends StatelessWidget {
  final Widget? fromSuffix;
  final Widget? toSuffix;
  final Widget icon;
  final TextEditingController fromController;
  final bool? readOnly;
  final Function()? onTap;
  final TextEditingController? toController;
  const TextFieldsContainer({
    super.key,
    required this.fromController,
    this.readOnly,
    this.onTap,
    required this.toController,
    required this.icon,
    this.fromSuffix,
    this.toSuffix,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.grey4,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 24, right: 16),
        child: Row(
          children: [
            icon,
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                children: [
                  TextField(
                    controller: fromController,
                    style: AppFonts.s16w600.copyWith(color: AppColors.white),
                    decoration: InputDecoration(
                      hintText: 'Куда - Москва',
                      hintStyle: AppFonts.s16w600.copyWith(
                        color: AppColors.grey6,
                      ),
                      border: const UnderlineInputBorder(),
                      suffix: fromSuffix,
                    ),
                  ),
                  TextField(
                    readOnly: readOnly ?? false,
                    onTap: onTap,
                    controller: toController,
                    style: AppFonts.s16w600.copyWith(color: AppColors.white),
                    decoration: InputDecoration(
                      suffix: toSuffix,
                      hintText: 'Куда - Турция',
                      hintStyle: AppFonts.s16w600.copyWith(
                        color: AppColors.grey6,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
