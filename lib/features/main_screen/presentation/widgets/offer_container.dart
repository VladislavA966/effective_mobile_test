import 'package:effective_mobile_test/core/resources/app_colors.dart';
import 'package:effective_mobile_test/core/resources/app_fonts.dart';
import 'package:effective_mobile_test/core/resources/app_images.dart';
import 'package:flutter/material.dart';

class OfferContainer extends StatelessWidget {
  final String image;
  final String title;
  final String town;
  final int price;
  const OfferContainer({
    super.key,
    required this.title,
    required this.town,
    required this.price,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 64),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildImage(),
          const SizedBox(height: 8),
          _buildTitle(),
          const SizedBox(height: 12),
          _buildTown(),
          const SizedBox(height: 12),
          _buildPrice(),
        ],
      ),
    );
  }

  Row _buildPrice() {
    return Row(
      children: [
        Image.asset(AppImages.planePrice),
        Text(
          'от $price ₽',
          style: AppFonts.s14w400.copyWith(
            color: AppColors.white,
          ),
        ),
      ],
    );
  }

  Text _buildTown() {
    return Text(
      town,
      style: AppFonts.s14w400.copyWith(
        color: AppColors.white,
      ),
    );
  }

  Text _buildTitle() {
    return Text(
      title,
      style: AppFonts.s16w600.copyWith(
        color: AppColors.white,
      ),
    );
  }

  SizedBox _buildImage() {
    return SizedBox(
      height: 133,
      width: 132,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
