import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../core/utils/social_links.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../blocs/home_bloc/home_bloc.dart';

class IntoActions extends StatelessWidget {
  const IntoActions({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = context.width < DeviceType.ipad.getMaxWidth();

    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 16,
          runSpacing: 14,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            CustomButton(
              label: 'View Projects',
              icon: Icons.rocket_launch_rounded,
              isGradient: true,
              onPressed: () {
                context.read<HomeBloc>().add(ChangeAppBarHeadersIndex(2));
              },
              width: 170,
            ),
            CustomButton(
              label: 'About Me',
              icon: Icons.person_outline_rounded,
              borderColor: AppColors.primaryColor,
              textColor: AppColors.primaryColor,
              onPressed: () {
                context.read<HomeBloc>().add(ChangeAppBarHeadersIndex(1));
              },
              width: 150,
            ),
            const CustomButton(
              label: 'My Resume',
              icon: Icons.picture_as_pdf_outlined,
              borderColor: AppColors.cardBorder,
              textColor: AppColors.white,
              onPressed: _openCV,
              width: 150,
            ),
          ],
        ),
        const SizedBox(height: 24),
        // Quick social links row in hero
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildHeroSocialBtn(
              icon: FontAwesomeIcons.github,
              url: SocialLinks.github,
              tooltip: 'GitHub',
            ),
            const SizedBox(width: 12),
            _buildHeroSocialBtn(
              icon: FontAwesomeIcons.linkedin,
              url: SocialLinks.linkedin,
              tooltip: 'LinkedIn',
            ),
            const SizedBox(width: 12),
            _buildHeroSocialBtn(
              icon: Icons.alternate_email_rounded,
              url: SocialLinks.email,
              tooltip: 'Email Me',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildHeroSocialBtn({
    required dynamic icon,
    required String url,
    required String tooltip,
  }) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () async {
          final uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri, mode: LaunchMode.externalApplication);
          }
        },
        child: Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: AppColors.cardBg,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: AppColors.cardBorder,
              width: 1,
            ),
          ),
          child: Center(
            child: icon is FaIconData
                ? FaIcon(
                    icon,
                    size: 18,
                    color: AppColors.textSecondary,
                  )
                : Icon(
                    icon as IconData,
                    size: 18,
                    color: AppColors.textSecondary,
                  ),
          ),
        ),
      ),
    );
  }
}

void _openCV() async {
  final uri = Uri.parse(SocialLinks.resume);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    debugPrint('Could not launch ${SocialLinks.resume}');
  }
}