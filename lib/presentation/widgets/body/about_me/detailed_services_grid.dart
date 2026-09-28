import 'package:flutter/material.dart';

import '../../../../core/utils/app_constants.dart';
import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_extensions.dart';
import 'detailed_service_item.dart';

class DetailedServicesGrid extends StatelessWidget {
  const DetailedServicesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = context.width;
    final int crossAxisCount = _getCrossAxisCount(width);
    final double aspectRatio = _getChildAspectRatio(width, crossAxisCount);

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        childAspectRatio: aspectRatio,
      ),
      itemBuilder: (context, index) {
        return DetailedServiceItem(
          service: AppConstants.services[index],
        );
      },
      itemCount: AppConstants.services.length,
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
      return deviceWidth < 380 ? 1.5 : 1.75;
    } else if (crossAxisCount == 2) {
      return 1.85;
    } else {
      if (deviceWidth > 1500) {
        return 2.15;
      } else if (deviceWidth > 1200) {
        return 1.95;
      }
      return 1.8;
    }
  }
}

