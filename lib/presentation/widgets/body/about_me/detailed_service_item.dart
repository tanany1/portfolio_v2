import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/widgets/hover_card.dart';
import '../../../../data/models/custom_service.dart';

class DetailedServiceItem extends StatelessWidget {
  const DetailedServiceItem({super.key, required this.service});

  final CustomService service;

  @override
  Widget build(BuildContext context) {
    return HoverCard(
      hoverBorderColor: AppColors.primaryColor,
      borderRadius: BorderRadius.circular(16),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              _buildServiceIcon(),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  service.service,
                  style: AppStyles.s18.copyWith(
                    color: AppColors.white,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            service.description,
            style: AppStyles.s14.copyWith(
              color: AppColors.textSecondary,
              height: 1.45,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          if (service.skills.isNotEmpty) ...[
            const SizedBox(height: 8),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: service.skills.map((skill) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: AppColors.scaffoldColor,
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: AppColors.primaryColor.withOpacity(0.2),
                    ),
                  ),
                  child: Text(
                    skill,
                    style: AppStyles.s12.copyWith(
                      color: AppColors.primaryColor,
                      fontSize: 11,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildServiceIcon() {
    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            AppColors.primaryColor.withOpacity(0.2),
            AppColors.accentPurple.withOpacity(0.15),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(
          color: AppColors.primaryColor.withOpacity(0.4),
          width: 1.5,
        ),
      ),
      child: Center(
        child: service.icon != null
            ? Icon(
                service.icon,
                color: AppColors.primaryColor,
                size: 22,
              )
            : service.logo.endsWith('.svg')
                ? SvgPicture.asset(
                    service.logo,
                    height: 22,
                    width: 22,
                  )
                : Image.asset(
                    service.logo,
                    height: 24,
                    width: 24,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(
                        Icons.code,
                        color: AppColors.primaryColor,
                        size: 24,
                      );
                    },
                  ),
      ),
    );
  }
}

