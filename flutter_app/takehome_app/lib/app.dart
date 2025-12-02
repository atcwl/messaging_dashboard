import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/chat/presentation/chat_list_screen.dart';
import 'features/dashboard/presentation/dashboard_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndex = 0;

  // FIX: remove const, define pages list correctly
  final List<Widget> pages = [ChatListScreen(), DashboardScreen()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system,
      home: Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (i) => setState(() => currentIndex = i),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Messages"),
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: "Dashboard",
            ),
          ],
        ),
      ),
    );
  }
}
