import 'package:flutter/material.dart';

import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_extensions.dart';
import '../../../../data/models/project.dart';
import 'project_item.dart';

class ProjectsGrid extends StatelessWidget {
  const ProjectsGrid({super.key, required this.projects});
  final List<Project> projects;

  @override
  Widget build(BuildContext context) {
    if (projects.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40),
          child: Text('No projects found in this category.'),
        ),
      );
    }

    final double width = context.width;
    final int crossAxisCount = _getCrossAxisCount(width);
    final double aspectRatio = _getChildAspectRatio(width, crossAxisCount);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 20,
        mainAxisSpacing: 24,
        childAspectRatio: aspectRatio,
      ),
      itemBuilder: (context, index) {
        return ProjectItem(
          key: ValueKey(projects[index].name),
          project: projects[index],
        );
      },
      itemCount: projects.length,
    );
  }

  int _getCrossAxisCount(double deviceWidth) {
    if (deviceWidth < DeviceType.mobile.getMaxWidth()) {
      return 1;
    } else if (deviceWidth < DeviceType.ipad.getMaxWidth()) {
      return 2;
    } else if (deviceWidth < DeviceType.smallScreenLaptop.getMaxWidth()) {
      return 2;
    } else {
      return 3;
    }
  }

  double _getChildAspectRatio(double deviceWidth, int crossAxisCount) {
    if (crossAxisCount == 1) {
      // Mobile: single column
      return deviceWidth < 380 ? 0.95 : 1.05;
    } else if (crossAxisCount == 2) {
      // Tablet / small laptop
      return deviceWidth < 900 ? 1.0 : 1.08;
    } else {
      // Desktop: 3 columns
      if (deviceWidth > 1500) {
        return 1.20;
      } else if (deviceWidth > 1200) {
        return 1.08;
      }
      return 1.02;
    }
  }
}

