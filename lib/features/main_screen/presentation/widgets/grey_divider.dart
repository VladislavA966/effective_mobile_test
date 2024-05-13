import 'package:effective_mobile_test/core/resources/app_colors.dart';
import 'package:flutter/material.dart';

class GreyDivider extends StatelessWidget {
  const GreyDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      color: AppColors.grey5,
    );
  }
}
