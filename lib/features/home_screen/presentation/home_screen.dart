import 'package:effective_mobile_test/core/resources/app_colors.dart';
import 'package:effective_mobile_test/core/resources/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class BottomNavBar extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const BottomNavBar({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.blue,
        unselectedItemColor: AppColors.grey6,
        backgroundColor: AppColors.black,
        items: [
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImages.planeTap,
                color: AppColors.grey6,
              ),
              activeIcon: SvgPicture.asset(
                AppImages.planeTap,
                color: AppColors.blue,
              ),
              label: 'Авиабилеты'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImages.sofaTap,
                color: AppColors.grey6,
              ),
              activeIcon: SvgPicture.asset(
                AppImages.sofaTap,
                color: AppColors.blue,
              ),
              label: 'Отели'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImages.geoTap,
                color: AppColors.grey6,
              ),
              activeIcon: SvgPicture.asset(
                AppImages.geoTap,
                color: AppColors.blue,
              ),
              label: 'Короче'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImages.notificationTap,
                color: AppColors.grey6,
              ),
              activeIcon: SvgPicture.asset(
                AppImages.notificationTap,
                color: AppColors.blue,
              ),
              label: 'Подписки'),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppImages.profileTap,
                color: AppColors.grey6,
              ),
              activeIcon: SvgPicture.asset(
                AppImages.profileTap,
                color: AppColors.blue,
              ),
              label: 'Профиль'),
        ],
        currentIndex: navigationShell.currentIndex,
        onTap: (index) => _onTap(context, index),
      ),
    );
  }

  void _onTap(BuildContext context, int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
