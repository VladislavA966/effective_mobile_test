import 'package:effective_mobile_test/core/resources/app_colors.dart';
import 'package:effective_mobile_test/core/resources/app_fonts.dart';
import 'package:effective_mobile_test/features/country_selected_scree/presentation/widgets/tickets_container.dart';
import 'package:flutter/material.dart';

class TicketInfoContainer extends StatelessWidget {
  const TicketInfoContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.grey3,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '6999 Р',
                style: AppFonts.s22w600.copyWith(
                  color: AppColors.white,
                ),
              ),
              Row(
                children: [
                  const CircleWidget(),
                  const SizedBox(width: 8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '3.15 - 7.10          4ч в пути/ без пересадок',
                        style: AppFonts.s14w400.copyWith(
                          color: AppColors.white,
                        ),
                      ),
                      Text(
                        'VKO     AER',
                        style:
                            AppFonts.s14w400.copyWith(color: AppColors.grey6),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}