import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_enums.dart';
import '../../../core/utils/app_extensions.dart';
import '../../../core/utils/app_styles.dart';
import '../../blocs/home_bloc/home_bloc.dart';

class CustomHeaderBtn extends StatefulWidget {
  const CustomHeaderBtn({
    super.key,
    required this.headerIndex,
    this.isActive = false,
  });
  final int headerIndex;
  final bool isActive;

  @override
  State<CustomHeaderBtn> createState() => _CustomHeaderBtnState();
}

class _CustomHeaderBtnState extends State<CustomHeaderBtn> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final bool isActive = widget.isActive;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: () {
          context.read<HomeBloc>().add(ChangeAppBarHeadersIndex(widget.headerIndex));
          if (context.read<HomeBloc>().appBarHeaderAxis == AppBarHeadersAxis.vertical) {
            context.read<HomeBloc>().add(ChangeAppBarHeadersAxis(AppBarHeadersAxis.horizontal));
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppBarHeaders.values[widget.headerIndex].getString(),
                style: AppStyles.s16.copyWith(
                  color: isActive || _isHovered
                      ? AppColors.primaryColor
                      : AppColors.textSecondary,
                  fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                ),
              ),
              const SizedBox(height: 6),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                height: 2.5,
                width: isActive ? 24 : (_isHovered ? 12 : 0),
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(2),
                  boxShadow: isActive
                      ? [
                          BoxShadow(
                            color: AppColors.primaryColor.withOpacity(0.5),
                            blurRadius: 8,
                          ),
                        ]
                      : null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

