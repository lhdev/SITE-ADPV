import 'package:flutter/material.dart';

import 'home_page.dart';

void main() {
  runApp(const SiteAdpvApp());
}

class SiteAdpvApp extends StatelessWidget {
  const SiteAdpvApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ADPV',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1E3A8A)),
        scaffoldBackgroundColor: const Color(0xFFF4F7FB),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
