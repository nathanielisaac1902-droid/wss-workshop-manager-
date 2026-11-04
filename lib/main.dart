import 'package:flutter/material.dart';
import 'screens/catalog_screen.dart';

void main() {
  runApp(const WorkshopApp());
}

class WorkshopApp extends StatelessWidget {
  const WorkshopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workshop Equipment Manager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF2E0854)),
        useMaterial3: true,
      ),
      home: const CatalogScreen(),
    );
  }
}