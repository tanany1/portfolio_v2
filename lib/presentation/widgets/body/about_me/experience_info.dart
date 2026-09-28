import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/hover_card.dart';

class ExperienceInfo extends StatelessWidget {
  const ExperienceInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = context.width < DeviceType.ipad.getMaxWidth();

    final stats = [
      _StatItem(
        number: '1+',
        label: 'Years Experience',
        subtitle: 'Flutter & Dart Specialist',
        icon: Icons.timeline_rounded,
        gradient: AppColors.primaryGradient,
      ),
      _StatItem(
        number: '19+',
        label: 'Completed Projects',
        subtitle: 'Mobile, IoT, AI & Desktop',
        icon: Icons.rocket_launch_rounded,
        gradient: AppColors.purpleGradient,
      ),
      _StatItem(
        number: '100%',
        label: 'Clean Architecture',
        subtitle: 'BLoC, MVVM & SOLID',
        icon: Icons.verified_rounded,
        gradient: AppColors.warmGradient,
      ),
      _StatItem(
        number: '12+',
        label: 'Libraries & Tools',
        subtitle: 'Firebase, Hive, Dio, NFC',
        icon: Icons.auto_awesome_rounded,
        gradient: AppColors.primaryGradient,
      ),
    ];

    if (isMobile) {
      return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          childAspectRatio: 1.15,
        ),
        itemCount: stats.length,
        itemBuilder: (context, index) => _buildStatCard(stats[index]),
      );
    }

    return Row(
      children: stats
          .map((stat) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: _buildStatCard(stat),
                ),
              ))
          .toList(),
    );
  }

  Widget _buildStatCard(_StatItem item) {
    return HoverCard(
      hoverBorderColor: AppColors.primaryColor,
      borderRadius: BorderRadius.circular(16),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ShaderMask(
                blendMode: BlendMode.srcIn,
                shaderCallback: (bounds) => item.gradient.createShader(
                  Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                ),
                child: Text(
                  item.number,
                  style: AppStyles.s40.copyWith(fontWeight: FontWeight.w800),
                ),
              ),
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColors.scaffoldColor,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: AppColors.cardBorder,
                  ),
                ),
                child: Icon(
                  item.icon,
                  size: 18,
                  color: AppColors.primaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            item.label,
            style: AppStyles.s16.copyWith(
              color: AppColors.white,
              fontWeight: FontWeight.w700,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Text(
            item.subtitle,
            style: AppStyles.s12.copyWith(
              color: AppColors.textMuted,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _StatItem {
  final String number;
  final String label;
  final String subtitle;
  final IconData icon;
  final LinearGradient gradient;

  _StatItem({
    required this.number,
    required this.label,
    required this.subtitle,
    required this.icon,
    required this.gradient,
  });
}

