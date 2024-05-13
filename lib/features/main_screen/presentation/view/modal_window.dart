import 'package:effective_mobile_test/config/routes.dart';
import 'package:effective_mobile_test/core/consts/app_strings.dart';
import 'package:effective_mobile_test/core/resources/app_colors.dart';
import 'package:effective_mobile_test/core/resources/app_fonts.dart';
import 'package:effective_mobile_test/core/resources/app_images.dart';
import 'package:effective_mobile_test/features/main_screen/presentation/widgets/decaration_container.dart';
import 'package:effective_mobile_test/features/main_screen/presentation/widgets/grey_divider.dart';
import 'package:effective_mobile_test/features/main_screen/presentation/widgets/icon_container_widget.dart';
import 'package:effective_mobile_test/features/main_screen/presentation/widgets/popular_container_widget.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ModalWindow extends StatefulWidget {
  const ModalWindow({
    super.key,
    required this.toController,
    required this.fromController,
    required this.focusNode,
  });

  final TextEditingController toController;
  final TextEditingController fromController;
  final FocusNode focusNode;

  @override
  State<ModalWindow> createState() => _ModalWindowState();
}

class _ModalWindowState extends State<ModalWindow> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(widget.focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.grey1,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(24),
          topLeft: Radius.circular(24),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SizedBox(height: 16),
            _buildCustomContainer(),
            const SizedBox(height: 24),
            _buildTextFieldsContainer(),
            const SizedBox(height: 24),
            _buildIconContainersRow(),
            const SizedBox(height: 30),
            _buildOffers(),
          ],
        ),
      ),
    );
  }

  DecorationContainer _buildOffers() {
    return DecorationContainer(
      content: Column(
        children: [
          _buildStambulOffer(),
          const GreyDivider(),
          _buildPhuketOffer(),
          const GreyDivider(),
          _buildSochiOffer(),
          const GreyDivider(),
        ],
      ),
    );
  }

  PopularOfferWidget _buildSochiOffer() {
    return PopularOfferWidget(
      townTitle: AppStrings.sochi,
      image: AppImages.sochiImage,
      onTap: () => _goToSelectedCountryScreen(
        AppStrings.sochi,
      ),
    );
  }

  PopularOfferWidget _buildPhuketOffer() {
    return PopularOfferWidget(
      townTitle: AppStrings.phucket,
      image: AppImages.phuketImage,
      onTap: () => _goToSelectedCountryScreen(
        AppStrings.phucket,
      ),
    );
  }

  PopularOfferWidget _buildStambulOffer() {
    return PopularOfferWidget(
      townTitle: AppStrings.stambul,
      image: AppImages.stambulImage,
      onTap: () => _goToSelectedCountryScreen(
        AppStrings.stambul,
      ),
    );
  }

  Row _buildIconContainersRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconContainer(
          color: AppColors.green,
          image: AppImages.routeIcon,
          title: AppStrings.difficultRouteTitle,
          onTap: () {},
        ),
        IconContainer(
          color: AppColors.blue,
          image: AppImages.earthIcon,
          title: AppStrings.earthTitle,
          onTap: () => _goToSelectedCountryScreen("Куда угодно"),
        ),
        IconContainer(
          color: AppColors.darBlue,
          image: AppImages.calendarIcon,
          onTap: () {},
          title: AppStrings.weekAndTitle,
        ),
        IconContainer(
          color: AppColors.red,
          image: AppImages.fireIcon,
          onTap: () {},
          title: AppStrings.hotOfferTitle,
        ),
      ],
    );
  }

  void _goToSelectedCountryScreen(String title) {
    widget.toController.text = title;
    context.goNamed(Routes.selectedCountryScreen.name, queryParameters: {
      "fromController": widget.fromController.text,
      "toController": widget.toController.text,
    });
  }

  Container _buildTextFieldsContainer() {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
          color: AppColors.grey3, borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            _firstTextField(),
            _secondTextField(),
          ],
        ),
      ),
    );
  }

  TextField _secondTextField() {
    return TextField(
      controller: widget.toController,
      focusNode: widget.focusNode,
      style: AppFonts.s16w600.copyWith(color: AppColors.white),
      decoration: InputDecoration(
        hintStyle: AppFonts.s16w600.copyWith(
          color: AppColors.grey6,
        ),
        hintText: 'Куда - Стамбул',
        prefixIcon: Image.asset(AppImages.searchIcon),
        border: InputBorder.none,
      ),
    );
  }

  TextField _firstTextField() {
    return TextField(
      controller: widget.fromController,
      style: AppFonts.s16w600.copyWith(color: AppColors.white),
      decoration: InputDecoration(
        hintStyle: AppFonts.s16w600.copyWith(
          color: AppColors.grey6,
        ),
        hintText: 'Куда - Москва',
        prefixIcon: Image.asset(AppImages.planeIcon),
        border: const UnderlineInputBorder(),
      ),
    );
  }

  Container _buildCustomContainer() {
    return Container(
      height: 5,
      width: 36,
      color: AppColors.grey5,
    );
  }
}
