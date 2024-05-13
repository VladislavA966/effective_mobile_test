import 'package:effective_mobile_test/core/consts/app_strings.dart';
import 'package:effective_mobile_test/core/resources/app_colors.dart';
import 'package:effective_mobile_test/core/resources/app_fonts.dart';
import 'package:flutter/material.dart';

class PopularOfferWidget extends StatelessWidget {
  final String townTitle;
  final String image;
  final Function()? onTap;
  const PopularOfferWidget({
    super.key,
    required this.townTitle,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Image.asset(image),
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                townTitle,
                style: AppFonts.s16w600.copyWith(
                  color: AppColors.white,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                AppStrings.popularRoute,
                style: AppFonts.s14w400.copyWith(
                  color: AppColors.grey5,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
