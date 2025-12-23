import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  // Base color for text
  static const _primaryTextColor = AppColors.grey700;
  static const _secondaryTextColor = AppColors.grey500;

  // Display
  static const displayLarge = TextStyle(
    fontSize: 48,
    fontWeight: FontWeight.bold,
    height: 1.2,
    letterSpacing: -1.0,
    color: _primaryTextColor,
  );

  static const displayMedium = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.bold,
    height: 1.2,
    letterSpacing: -0.5,
    color: _primaryTextColor,
  );

  static const displaySmall = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    height: 1.3,
    color: _primaryTextColor,
  );

  // Heading
  static const headingLarge = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    height: 1.4,
    color: _primaryTextColor,
  );

  static const headingMedium = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    height: 1.4,
    color: _primaryTextColor,
  );

  static const headingSmall = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    height: 1.5,
    color: _primaryTextColor,
  );

  // Body
  static const bodyLarge = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.normal,
    height: 1.6,
    color: _primaryTextColor,
  );

  static const bodyMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.normal,
    height: 1.5,
    color: _primaryTextColor,
  );

  static const bodySmall = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    height: 1.5,
    color: _secondaryTextColor,
  );

  // Label
  static const labelLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    height: 1.4,
    color: _primaryTextColor,
  );

  static const labelMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    height: 1.4,
    color: _primaryTextColor,
  );

  static const labelSmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    height: 1.4,
    color: _secondaryTextColor,
  );
}
