import 'package:flutter/material.dart';

class AppColors {
  // Primary Colors
  static const Color primary = Color(0xFF1E3A8A); // Space Blue
  static const Color secondary = Color(0xFFF59E0B); // Rocket Orange
  static const Color accent = Color(0xFF8B5CF6); // Purple Accent

  // Status Colors
  static const Color success = Color(0xFF10B981); // Mission Green
  static const Color error = Color(0xFFEF4444); // Launch Red
  static const Color warning = Color(0xFFF59E0B); // Warning Orange

  // Background Colors
  static const Color background = Color(0xFF0F172A); // Dark Space
  static const Color darkCardColor = Color(0xFF1E293B); // Dark Card Surface
  static const Color lightCardColor = Color(0xFFF5F5F5); // Light Card Surface
  static const Color lightBackground = Color(0xFFFAFAFA); // Light Background
  static const Color lightSurface = Color(0xFFFFFFFF); // Light Surface

  // Text Colors
  // static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color lightTextPrimary = Color(0xFFEEF1F6);
  static const Color darkTextPrimary = Color(0xFFEEF1F6);
  static const Color textSecondary = Color(0xFF94A3B8);
  static const Color textLightSecondary = Color(0xFF64748B);
  static const Color lightGrey = Color(0xFF9298A6);

  // Gradient Colors
  static const LinearGradient spaceGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1E3A8A), Color(0xFF3B82F6), Color(0xFF8B5CF6)],
  );

  static const LinearGradient rocketGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFF59E0B), Color(0xFFEF4444)],
  );
}
