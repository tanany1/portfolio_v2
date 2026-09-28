import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class HoverCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final BorderRadius? borderRadius;
  final Color? backgroundColor;
  final Color? hoverBorderColor;
  final double translateY;
  final EdgeInsetsGeometry? padding;

  const HoverCard({
    super.key,
    required this.child,
    this.onTap,
    this.borderRadius,
    this.backgroundColor,
    this.hoverBorderColor,
    this.translateY = -4.0,
    this.padding,
  });

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final radius = widget.borderRadius ?? BorderRadius.circular(16);
    final hoverColor = widget.hoverBorderColor ?? AppColors.primaryColor;

    return RepaintBoundary(
      child: MouseRegion(
        cursor: widget.onTap != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedSlide(
            duration: const Duration(milliseconds: 150),
            curve: Curves.easeOut,
            offset: Offset(0, _isHovered ? -0.015 : 0),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeOut,
              padding: widget.padding,
              decoration: BoxDecoration(
                color: widget.backgroundColor ??
                    (_isHovered ? AppColors.cardBgElevated : AppColors.cardBg),
                borderRadius: radius,
                border: Border.all(
                  color: _isHovered ? hoverColor : AppColors.cardBorder,
                  width: 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: _isHovered
                        ? hoverColor.withOpacity(0.25)
                        : const Color(0x22000000),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}

