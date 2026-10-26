 import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'theme/app_theme.dart';
import 'screens/login_screen.dart';
import 'screens/main_navigation_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Color(0xFF0B1015),
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const JardinerosApp());
}

class JardinerosApp extends StatefulWidget {
  const JardinerosApp({super.key});

  @override
  State<JardinerosApp> createState() => _JardinerosAppState();
}

class _JardinerosAppState extends State<JardinerosApp> {
  bool _isDarkMode = true;
  bool _isLoggedIn = false;

  void _toggleTheme(bool isDark) {
    AppColors.isDarkMode = isDark;
    setState(() {
      _isDarkMode = isDark;
    });
  }

  void _onLoginSuccess() {
    setState(() {
      _isLoggedIn = true;
    });
  }

  void _onLogout() {
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jardineros Al Rescate',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: _isLoggedIn
          ? MainNavigationScreen(
              isDarkMode: _isDarkMode,
              onToggleTheme: _toggleTheme,
              onLogout: _onLogout,
            )
          : LoginScreen(
              onLoginSuccess: _onLoginSuccess,
              isDarkMode: _isDarkMode,
              onToggleTheme: _toggleTheme,
            ),
    );
  }
}
