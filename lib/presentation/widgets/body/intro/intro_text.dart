import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/app_styles.dart';
import 'intro_actions.dart';

class IntroText extends StatelessWidget {
  const IntroText({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = context.width < DeviceType.ipad.getMaxWidth();

    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Available for work pill
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
          decoration: BoxDecoration(
            color: AppColors.success.withOpacity(0.12),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(
              color: AppColors.success.withOpacity(0.4),
              width: 1,
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: AppColors.success,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'Available for New Opportunities',
                style: AppStyles.s12.copyWith(
                  color: AppColors.success,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          '${AppStrings.helloIM} 👋',
          style: isMobile
              ? AppStyles.s18.copyWith(color: AppColors.textSecondary)
              : AppStyles.s24.copyWith(color: AppColors.textSecondary),
          textAlign: _getTextAlign(context.width),
        ),
        const SizedBox(height: 8),
        AppStyles.gradientText(
          text: AppStrings.developerName,
          style: isMobile ? AppStyles.s32 : AppStyles.s52,
          textAlign: _getTextAlign(context.width),
        ),
        const SizedBox(height: 8),
        Text(
          'Flutter & Cross-Platform Mobile Engineer',
          style: AppStyles.s20.copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w600,
          ),
          textAlign: _getTextAlign(context.width),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: isMobile ? context.width - 40 : context.width * 0.42,
          child: Text(
            AppStrings.introMsg,
            style: isMobile
                ? AppStyles.s14.copyWith(height: 1.6)
                : AppStyles.s18.copyWith(height: 1.6),
            textAlign: _getTextAlign(context.width),
            softWrap: true,
          ),
        ),
        const SizedBox(height: 20),
        // Mini Hero Tech Pills
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            'Flutter',
            'Dart',
            'Firebase',
            'BLoC',
            'Clean Architecture',
            'REST APIs',
          ].map((tech) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: AppColors.cardBg,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.cardBorder,
                ),
              ),
              child: Text(
                tech,
                style: AppStyles.s12.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }).toList(),
        ),
        const SizedBox(height: 32),
        const IntoActions(),
      ],
    );
  }

  TextAlign _getTextAlign(double screenWidth) {
    return screenWidth < DeviceType.ipad.getMaxWidth()
        ? TextAlign.center
        : TextAlign.start;
  }
}

