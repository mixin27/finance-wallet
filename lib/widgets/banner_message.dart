import 'dart:ui';

import 'package:flutter/material.dart';

/// Glass-styled error message banner
class GlassErrorMessage extends StatelessWidget {
  final String message;
  final IconData icon;
  final VoidCallback? onDismiss;
  final EdgeInsetsGeometry? margin;

  const GlassErrorMessage({
    super.key,
    required this.message,
    this.icon = Icons.error_outline,
    this.onDismiss,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final errorColor = theme.colorScheme.error;

    return Container(
      margin: margin ?? const EdgeInsets.only(bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              color: errorColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: errorColor.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Icon(icon, color: errorColor, size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    message,
                    style: TextStyle(
                      color: errorColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                if (onDismiss != null) ...[
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: onDismiss,
                    child: Icon(
                      Icons.close,
                      color: errorColor.withValues(alpha: 0.7),
                      size: 18,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Glass-styled success message banner
class GlassSuccessMessage extends StatelessWidget {
  final String message;
  final IconData icon;
  final VoidCallback? onDismiss;
  final EdgeInsetsGeometry? margin;

  const GlassSuccessMessage({
    super.key,
    required this.message,
    this.icon = Icons.check_circle_outline,
    this.onDismiss,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    // We use a custom green for success since it's not always in basic ColorScheme
    const successColor = Color(0xFF48BB78);

    return Container(
      margin: margin ?? const EdgeInsets.only(bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              color: successColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: successColor.withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Icon(icon, color: successColor, size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    message,
                    style: const TextStyle(
                      color: successColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                if (onDismiss != null) ...[
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: onDismiss,
                    child: Icon(
                      Icons.close,
                      color: successColor.withValues(alpha: 0.7),
                      size: 18,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Glass-styled warning message banner
class GlassWarningMessage extends StatelessWidget {
  final String message;
  final IconData icon;
  final VoidCallback? onDismiss;
  final EdgeInsetsGeometry? margin;

  const GlassWarningMessage({
    super.key,
    required this.message,
    this.icon = Icons.warning_amber_outlined,
    this.onDismiss,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.only(bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFFF59E0B).withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xFFF59E0B).withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Icon(icon, color: const Color(0xFFFDE68A), size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    message,
                    style: const TextStyle(
                      color: Color(0xFFFDE68A),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                if (onDismiss != null) ...[
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: onDismiss,
                    child: Icon(
                      Icons.close,
                      color: const Color(0xFFFDE68A).withValues(alpha: 0.7),
                      size: 18,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// Glass-styled info message banner
class GlassInfoMessage extends StatelessWidget {
  final String message;
  final IconData icon;
  final VoidCallback? onDismiss;
  final EdgeInsetsGeometry? margin;

  const GlassInfoMessage({
    super.key,
    required this.message,
    this.icon = Icons.info_outline,
    this.onDismiss,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.only(bottom: 16),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF3B82F6).withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: const Color(0xFF3B82F6).withValues(alpha: 0.3),
                width: 1,
              ),
            ),
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Icon(icon, color: const Color(0xFFBFDBFE), size: 20),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    message,
                    style: const TextStyle(
                      color: Color(0xFFBFDBFE),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                if (onDismiss != null) ...[
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: onDismiss,
                    child: Icon(
                      Icons.close,
                      color: const Color(0xFFBFDBFE).withValues(alpha: 0.7),
                      size: 18,
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
