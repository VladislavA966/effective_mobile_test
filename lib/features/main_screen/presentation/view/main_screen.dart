import 'package:effective_mobile_test/core/consts/app_strings.dart';
import 'package:effective_mobile_test/core/resources/app_colors.dart';
import 'package:effective_mobile_test/core/resources/app_fonts.dart';
import 'package:effective_mobile_test/core/resources/app_images.dart';
import 'package:effective_mobile_test/features/main_screen/presentation/bloc/offers/offers_bloc.dart';
import 'package:effective_mobile_test/features/main_screen/presentation/widgets/main_button.dart';
import 'package:effective_mobile_test/features/main_screen/presentation/view/modal_window.dart';
import 'package:effective_mobile_test/features/main_screen/presentation/widgets/offer_container.dart';
import 'package:effective_mobile_test/features/main_screen/presentation/widgets/decaration_container.dart';
import 'package:effective_mobile_test/features/main_screen/presentation/widgets/text_fields_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final toController = TextEditingController();
  final fromController = TextEditingController();
  final focusNode = FocusNode();
  Map<int, String> images = {
    1: AppImages.firstImage,
    2: AppImages.secondImage,
    3: AppImages.thirdImage,
  };
  @override
  void initState() {
    BlocProvider.of<OffersBloc>(context).add(GetOffersEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildFirstTitle(),
                const SizedBox(height: 32),
                _buildTextFieldController(),
                const SizedBox(height: 32),
                _buildMusicTitle(),
                const SizedBox(height: 25),
                _buildOffersList(),
                const SizedBox(height: 12),
                _buildMainButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  MainButton _buildMainButton() {
    return MainButton(
      title: 'Показать на месте',
      color: AppColors.grey3,
      onPressed: () {},
    );
  }

  DecorationContainer _buildTextFieldController() {
    return DecorationContainer(
      content: TextFieldsContainer(
        fromController: fromController,
        onTap: _showModalWindow,
        toController: toController,
        icon: Image.asset(
          AppImages.searchIcon,
        ),
      ),
    );
  }

  void _showModalWindow() {
    showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return ModalWindow(
          focusNode: focusNode,
          toController: toController,
          fromController: fromController,
        );
      },
    );
  }

  BlocBuilder<OffersBloc, OffersState> _buildOffersList() {
    return BlocBuilder<OffersBloc, OffersState>(
      builder: (context, state) {
        if (state is OffersLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is OffersLoaded) {
          return SizedBox(
            height: 240,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: state.offers.offers.length,
              itemBuilder: (context, index) =>
                  _buildOfferContainer(state, index),
            ),
          );
        } else if (state is OffersError) {
          return Center(
            child: Text(
              "Error 404",
              style: AppFonts.s16w600.copyWith(
                color: AppColors.white,
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }

  OfferContainer _buildOfferContainer(OffersLoaded state, int index) {
    return OfferContainer(
      image: images[state.offers.offers[index].id]!,
      title: state.offers.offers[index].title,
      town: state.offers.offers[index].town,
      price: state.offers.offers[index].price.value,
    );
  }

  Text _buildMusicTitle() {
    return Text(
      AppStrings.musicTitle,
      style: AppFonts.s22w600.copyWith(
        color: AppColors.white,
      ),
    );
  }

  Center _buildFirstTitle() {
    return Center(
      child: Text(
        textAlign: TextAlign.center,
        AppStrings.mainTitle,
        style: AppFonts.s22w600.copyWith(
          color: AppColors.white,
        ),
      ),
    );
  }
}
