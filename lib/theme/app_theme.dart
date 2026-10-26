import 'package:flutter/material.dart';

class AppColors {
  // Global theme controller state
  static bool isDarkMode = true;

  // Adaptive background and surface colors
  // Dark mode is now rich Obsidian / Deep Slate (vibrant, high contrast, not muddy/opaco)
  // Light mode has pure white cards and crisp canvas so text is always clear
  static Color get background => isDarkMode ? const Color(0xFF0B1015) : const Color(0xFFF8FAFC);
  static Color get surface => isDarkMode ? const Color(0xFF121A22) : const Color(0xFFFFFFFF);
  static Color get surfaceCard => isDarkMode ? const Color(0xFF16212B) : const Color(0xFFFFFFFF);
  static Color get surfaceElevated => isDarkMode ? const Color(0xFF1D2B37) : const Color(0xFFF1F5F9);
  static Color get border => isDarkMode ? const Color(0xFF243644) : const Color(0xFFE2E8F0);
  static Color get borderSubtle => isDarkMode ? const Color(0xFF1A2732) : const Color(0xFFEEF2F6);

  // Mint / Green accents
  static const Color mint = Color(0xFF00E599);
  static const Color mintLight = Color(0xFFD4F9EC);
  static const Color mintDark = Color(0xFF059669);
  static const Color greenBadge = Color(0xFF10B981);
  static const Color greenBadgeBg = Color(0xFF0E3831);

  // Status & secondary colors
  static const Color cyan = Color(0xFF38BDF8);
  static const Color amber = Color(0xFFF59E0B);
  static const Color amberBg = Color(0xFF3A2B13);
  static const Color coral = Color(0xFFEF4444);
  static const Color coralBg = Color(0xFF391B1B);

  // Text colors - High contrast in both themes!
  // In light mode, text is rich dark slate (#0F172A), completely fixing unreadable text!
  static Color get textPrimary => isDarkMode ? const Color(0xFFF8FAFC) : const Color(0xFF0F172A);
  static Color get textSecondary => isDarkMode ? const Color(0xFFA1B3C4) : const Color(0xFF475569);
  static Color get textMuted => isDarkMode ? const Color(0xFF6B7F92) : const Color(0xFF64748B);
  static Color get textMint => isDarkMode ? const Color(0xFF00E599) : const Color(0xFF059669);

  // Light theme alternative aliases
  static const Color lightBg = Color(0xFFF8FAFC);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightBorder = Color(0xFFE2E8F0);
}

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF0B1015),
      fontFamily: 'Roboto',
      colorScheme: const ColorScheme.dark(
        primary: AppColors.mint,
        onPrimary: Color(0xFF042018),
        surface: Color(0xFF121A22),
        onSurface: Color(0xFFF8FAFC),
        outline: Color(0xFF243644),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          color: Color(0xFFF8FAFC),
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
        iconTheme: IconThemeData(color: Color(0xFFF8FAFC)),
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFF16212B),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Color(0xFF243644), width: 1),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFF121A22),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        hintStyle: const TextStyle(color: Color(0xFF6B7F92), fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFF243644), width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFF243644), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.mint, width: 1.5),
        ),
      ),
    );
  }

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      fontFamily: 'Roboto',
      colorScheme: const ColorScheme.light(
        primary: AppColors.mintDark,
        surface: Color(0xFFFFFFFF),
        onSurface: Color(0xFF0F172A),
        outline: Color(0xFFE2E8F0),
      ),
      cardTheme: CardThemeData(
        color: const Color(0xFFFFFFFF),
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Color(0xFFE2E8F0), width: 1),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: const Color(0xFFF1F5F9),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        hintStyle: const TextStyle(color: Color(0xFF64748B), fontSize: 14),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0), width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: Color(0xFFE2E8F0), width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.mintDark, width: 1.5),
        ),
      ),
    );
  }
}
