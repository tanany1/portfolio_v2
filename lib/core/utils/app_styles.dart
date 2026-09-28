import 'package:flutter/material.dart';

import 'app_colors.dart';

abstract class AppStyles {
  static TextStyle s52 = const TextStyle(
    color: AppColors.textPrimary,
    fontSize: 52,
    fontWeight: FontWeight.w700,
    letterSpacing: -1.0,
    fontFamily: 'Poppins',
  );

  static TextStyle s40 = const TextStyle(
    color: AppColors.textPrimary,
    fontSize: 40,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
    fontFamily: 'Poppins',
  );

  static TextStyle s32 = const TextStyle(
    color: AppColors.primaryColor,
    fontSize: 32,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
    fontFamily: 'Poppins',
  );

  static TextStyle s28 = const TextStyle(
    color: AppColors.primaryColor,
    fontSize: 28,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins',
  );

  static TextStyle s24 = const TextStyle(
    color: AppColors.textPrimary,
    fontSize: 24,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins',
  );

  static TextStyle s20 = const TextStyle(
    color: AppColors.textPrimary,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins',
  );

  static TextStyle s18 = const TextStyle(
    color: AppColors.textSecondary,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 1.6,
    fontFamily: 'Poppins',
  );

  static TextStyle s17 = const TextStyle(
    color: AppColors.textSecondary,
    fontSize: 17,
    fontWeight: FontWeight.w400,
    height: 1.5,
    fontFamily: 'Poppins',
  );

  static TextStyle s16 = const TextStyle(
    color: AppColors.textPrimary,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins',
  );

  static TextStyle s14 = const TextStyle(
    color: AppColors.textSecondary,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'Poppins',
  );

  static TextStyle s12 = const TextStyle(
    color: AppColors.textMuted,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins',
  );

  static Widget gradientText({
    required String text,
    required TextStyle style,
    Gradient gradient = AppColors.primaryGradient,
    TextAlign textAlign = TextAlign.start,
  }) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: style,
        textAlign: textAlign,
      ),
    );
  }
}

