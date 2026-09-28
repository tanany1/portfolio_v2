import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/social_links.dart';

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({super.key});

  @override
  Widget build(BuildContext context) {
    return const Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        SocialMediaIconBtn(
          icon: FontAwesomeIcons.github,
          link: SocialLinks.github,
          label: 'GitHub',
        ),
        SocialMediaIconBtn(
          icon: FontAwesomeIcons.linkedinIn,
          link: SocialLinks.linkedin,
          label: 'LinkedIn',
        ),
        SocialMediaIconBtn(
          icon: FontAwesomeIcons.facebookF,
          link: SocialLinks.facebook,
          label: 'Facebook',
        ),
        SocialMediaIconBtn(
          icon: FontAwesomeIcons.instagram,
          link: SocialLinks.instagram,
          label: 'Instagram',
        ),
        SocialMediaIconBtn(
          icon: Icons.alternate_email_rounded,
          link: SocialLinks.email,
          label: 'Email',
        ),
      ],
    );
  }
}

class SocialMediaIconBtn extends StatefulWidget {
  const SocialMediaIconBtn({
    super.key,
    required this.icon,
    this.link,
    this.label,
  });

  final dynamic icon;
  final String? link;
  final String? label;

  @override
  State<SocialMediaIconBtn> createState() => _SocialMediaIconBtnState();
}

class _SocialMediaIconBtnState extends State<SocialMediaIconBtn> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: widget.label ?? '',
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: _isHovered
                ? AppColors.primaryColor.withOpacity(0.15)
                : AppColors.cardBg,
            shape: BoxShape.circle,
            border: Border.all(
              color: _isHovered
                  ? AppColors.primaryColor
                  : AppColors.cardBorder,
              width: 1.5,
            ),
            boxShadow: [
              if (_isHovered)
                BoxShadow(
                  color: AppColors.primaryColor.withOpacity(0.3),
                  blurRadius: 14,
                ),
            ],
          ),
          child: IconButton(
            onPressed: () async {
              if (widget.link != null) {
                final uri = Uri.parse(widget.link!);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                }
              }
            },
            icon: widget.icon is FaIconData
                ? FaIcon(
                    widget.icon as FaIconData,
                    color: _isHovered ? AppColors.primaryColor : AppColors.textSecondary,
                    size: 20,
                  )
                : Icon(
                    widget.icon as IconData,
                    color: _isHovered ? AppColors.primaryColor : AppColors.textSecondary,
                    size: 20,
                  ),
          ),
        ),
      ),
    );
  }
}

