import 'package:flutter/material.dart';

import '../../../../core/utils/app_enums.dart';
import '../../../../core/utils/app_extensions.dart';
import 'intro_circle_image_box.dart';
import 'intro_text.dart';

class IntroSection extends StatelessWidget {
  const IntroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isStacked = context.width < DeviceType.ipad.getMaxWidth();

    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: (context.height * 0.08).clamp(30.0, 90.0),
      ),
      child: isStacked
          ? const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IntroCircleImageBox(),
                SizedBox(height: 40),
                IntroText(),
              ],
            )
          : const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(child: IntroText()),
                SizedBox(width: 48),
                IntroCircleImageBox(),
              ],
            ),
    );
  }
}

