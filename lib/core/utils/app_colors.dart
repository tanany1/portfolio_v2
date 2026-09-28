import 'package:flutter/material.dart';

abstract class AppColors {
  static const Color white = Color(0xffffffff);
  static const Color lightColor = Color(0xffF1F5F9);
  static const Color lowPriority = Color(0xff64748B);
  static const Color primaryColor = Color(0xff00D2FF);
  static const Color primaryBlue = Color(0xff0284C7);
  static const Color primaryGradientEnd = Color(0xff3B82F6);
  static const Color secondaryColor = Color(0xffF59E0B);
  static const Color accentPurple = Color(0xff8B5CF6);
  static const Color accentPink = Color(0xffEC4899);
  static const Color success = Color(0xff10B981);
  static const Color darkColor = Color(0xff0F172A);
  static const Color scaffoldColor = Color(0xff0B0F19);
  static const Color appBarColor = Color(0xff0B0F19);
  static const Color primaryLight = Color(0xff1E293B);
  static const Color cardBg = Color(0xff111827);
  static const Color cardBgElevated = Color(0xff162032);
  static const Color cardBorder = Color(0xff1F293D);
  static const Color textPrimary = Color(0xffF8FAFC);
  static const Color textSecondary = Color(0xff94A3B8);
  static const Color textMuted = Color(0xff64748B);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primaryColor, primaryGradientEnd],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient purpleGradient = LinearGradient(
    colors: [accentPurple, Color(0xff6366F1)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient warmGradient = LinearGradient(
    colors: [Color(0xffF59E0B), Color(0xffEF4444)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
