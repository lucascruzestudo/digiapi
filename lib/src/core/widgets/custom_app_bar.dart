import 'package:digiapi/src/core/constants/app_colors.dart';
import 'package:digiapi/src/core/constants/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isLogo;
  final bool showBackButton;

  const CustomAppBar(
      {Key? key,
      required this.title,
      this.showBackButton = false,
      this.isLogo = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.primaryColor,
      centerTitle: isLogo,
      title: Text(
              title,
              style: AppTextStyles.title,
            ),
      leading: showBackButton
          ? IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.arrow_back),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
