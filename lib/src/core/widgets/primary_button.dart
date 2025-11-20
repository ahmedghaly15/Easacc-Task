import 'package:flutter/material.dart';

import '../theming/app_colors.dart';
import '../theming/app_text_styles.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onPressed,
    this.text,
    this.borderRadius,
    this.textStyle,
    this.backgroundColor,
    this.textColor,
    this.boxShadow,
    this.child,
    this.width,
    this.height,
    this.isExpanded = true,
    this.padding,
  });

  final String? text;
  final double? borderRadius;
  final TextStyle? textStyle;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback? onPressed;
  final List<BoxShadow>? boxShadow;
  final Widget? child;
  final double? width;
  final double? height;
  final bool isExpanded;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isExpanded ? double.infinity : width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.primary,
        borderRadius: BorderRadiusDirectional.circular((borderRadius) ?? 16.0),
        boxShadow: boxShadow,
        border: Border.all(color: AppColors.primary, width: 1),
      ),
      child: MaterialButton(
        onPressed: onPressed,
        padding: height == null
            ? (padding ?? const EdgeInsets.symmetric(vertical: 14))
            : null,
        materialTapTargetSize: MaterialTapTargetSize.padded,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular((borderRadius) ?? 16),
        ),
        child:
            child ??
            Text(
              text!,
              style:
                  textStyle ??
                  AppTextStyles.font16SemiBold.copyWith(
                    color: textColor ?? Colors.white,
                  ),
            ),
      ),
    );
  }
}
