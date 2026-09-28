import 'package:flutter/material.dart';

import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../data/models/responsive_size.dart';

class IntroCircleImageBox extends StatelessWidget {
  const IntroCircleImageBox({super.key});

  @override
  Widget build(BuildContext context) {
    final responsiveSize = ResponsiveSize(
      deviceWidth: context.width,
      mobileSize: context.width * 0.70,
      ipadSize: context.width * 0.45,
      smallScreenSize: context.width * 0.32,
    );

    final double size =
        (responsiveSize.getSize() ?? 300.0).clamp(240.0, 400.0);

    return RepaintBoundary(
      child: SizedBox(
        width: size,
        height: size,
        child: Stack(
          alignment: Alignment.center,
          children: [
            // Inner Gradient Ring
            Container(
              width: size * 0.85,
              height: size * 0.85,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: AppColors.primaryGradient,
                boxShadow: [
                  BoxShadow(
                    color: Color(0x3300D2FF),
                    blurRadius: 20,
                    spreadRadius: 1,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(4),
              child: Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.cardBg,
                  image: DecorationImage(
                    image: AssetImage(AppAssets.devImg),
                    fit: BoxFit.cover,
                    alignment: Alignment(0, -0.15),
                  ),
                ),
              ),
            ),

            // Floating Badge 1 (Top Left: Flutter Dev)
            Positioned(
              top: size * 0.08,
              left: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.cardBgElevated,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0x8000D2FF),
                    width: 1.5,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x66000000),
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.flutter_dash,
                      color: AppColors.primaryColor,
                      size: 18,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Flutter Dev',
                      style: AppStyles.s12.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Floating Badge 2 (Bottom Right: Clean Code)
            Positioned(
              bottom: size * 0.08,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                decoration: BoxDecoration(
                  color: AppColors.cardBgElevated,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0x808B5CF6),
                    width: 1.5,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x66000000),
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.verified_rounded,
                      color: AppColors.accentPurple,
                      size: 18,
                    ),
                    const SizedBox(width: 6),
                    Text(
                      'Clean Code',
                      style: AppStyles.s12.copyWith(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


