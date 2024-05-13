import 'package:effective_mobile_test/core/resources/app_colors.dart';
import 'package:effective_mobile_test/core/resources/app_fonts.dart';
import 'package:flutter/material.dart';

class TicketContainer extends StatelessWidget {
  final int price;
  final String lines;
  final String timeRange;
  const TicketContainer({
    super.key,
    required this.price,
    required this.lines,
    required this.timeRange,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const CircleWidget(),
              const SizedBox(width: 14),
              Text(
                lines,
                style: AppFonts.s14w400.copyWith(
                  color: AppColors.white,
                ),
              ),
              const Spacer(),
              Text(
                '$price ₽',
                style: AppFonts.s14w400.copyWith(
                  color: AppColors.blue,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.arrow_forward_ios,
                color: AppColors.blue,
                size: 16,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            timeRange,
            overflow: TextOverflow.ellipsis,
            style: AppFonts.s14w400.copyWith(color: AppColors.grey6),
          )
        ],
      ),
    );
  }
}

class CircleWidget extends StatelessWidget {
  const CircleWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: const ShapeDecoration(
        color: AppColors.red,
        shape: CircleBorder(),
      ),
    );
  }
}
