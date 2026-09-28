import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/app_colors.dart';
import '../utils/app_styles.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    this.height,
    required this.label,
    this.icon,
    this.backgroundColor,
    this.borderColor,
    this.onPressed,
    this.width,
    this.textColor,
    this.isGradient = false,
  });

  final Function()? onPressed;
  final Color? backgroundColor;
  final Color? borderColor;
  final Color? textColor;
  final double? height;
  final dynamic icon;
  final String label;
  final double? width;
  final bool isGradient;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final effectiveTextColor = widget.textColor ??
        (widget.backgroundColor != null || widget.isGradient
            ? AppColors.white
            : AppColors.primaryColor);

    return MouseRegion(
      cursor: widget.onPressed != null ? SystemMouseCursors.click : SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.03 : 1.0,
        duration: const Duration(milliseconds: 180),
        curve: Curves.easeOutCubic,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          height: widget.height ?? 48,
          width: widget.width,
          decoration: BoxDecoration(
            gradient: widget.isGradient ? AppColors.primaryGradient : null,
            color: widget.isGradient
                ? null
                : (widget.backgroundColor ??
                    (_isHovered ? AppColors.primaryColor.withOpacity(0.12) : Colors.transparent)),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: widget.borderColor ??
                  (widget.isGradient ? Colors.transparent : (widget.backgroundColor ?? AppColors.primaryColor)),
              width: 1.5,
            ),
            boxShadow: [
              if (_isHovered)
                BoxShadow(
                  color: (widget.borderColor ?? widget.backgroundColor ?? AppColors.primaryColor)
                      .withOpacity(0.25),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: widget.onPressed,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (widget.icon != null) ...[
                      if (widget.icon is FaIconData)
                        FaIcon(
                          widget.icon as FaIconData,
                          size: 18,
                          color: effectiveTextColor,
                        )
                      else if (widget.icon is IconData)
                        Icon(
                          widget.icon as IconData,
                          size: 18,
                          color: effectiveTextColor,
                        )
                      else if (widget.icon is Widget)
                        widget.icon as Widget,
                      const SizedBox(width: 8),
                    ],
                    Flexible(
                      child: AutoSizeText(
                        widget.label,
                        style: AppStyles.s16.copyWith(
                          color: effectiveTextColor,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                        minFontSize: 10,
                        maxLines: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
