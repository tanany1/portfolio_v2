import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../data/models/project.dart';
import 'project_details_dialog.dart';

class ProjectActions extends StatelessWidget {
  const ProjectActions({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context) {
    final bool hasDemo =
        project.previewLink != null && project.previewLink!.trim().isNotEmpty;

    return Row(
      children: [
        // Button 1: Live Demo (if available) OR Project Gallery / Preview
        Expanded(
          child: CustomButton(
            height: 38,
            label: hasDemo ? 'Live Demo' : 'Gallery',
            icon: hasDemo ? Icons.launch_rounded : Icons.photo_library_outlined,
            isGradient: hasDemo,
            borderColor: hasDemo ? null : AppColors.primaryColor.withOpacity(0.55),
            textColor: hasDemo ? AppColors.white : AppColors.primaryColor,
            onPressed: () async {
              if (hasDemo) {
                final uri = Uri.parse(project.previewLink!.trim());
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri, mode: LaunchMode.externalApplication);
                }
              } else {
                ProjectDetailsDialog.show(context, project);
              }
            },
          ),
        ),
        const SizedBox(width: 8),
        // Button 2: GitHub Repository
        Expanded(
          child: CustomButton(
            height: 38,
            label: 'GitHub',
            icon: FontAwesomeIcons.github,
            backgroundColor: AppColors.cardBgElevated,
            borderColor: AppColors.cardBorder,
            textColor: AppColors.white,
            onPressed: () async {
              final link = project.githubRepoLink ?? 'https://github.com/tanany1';
              final uri = Uri.parse(link);
              if (await canLaunchUrl(uri)) {
                await launchUrl(uri, mode: LaunchMode.externalApplication);
              }
            },
          ),
        ),
      ],
    );
  }
}
