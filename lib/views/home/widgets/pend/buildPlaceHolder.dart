import 'package:flutter/material.dart';

import '../../../../core/constants/app_colors.dart';

Widget buildPlaceholderScreen(String title, String icon, Color color) {
  return Scaffold(
    backgroundColor: AppColors.cream,
    appBar: AppBar(
      backgroundColor: color,
      elevation: 0,
      title: Text(title, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.white),
    ),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(icon, style: const TextStyle(fontSize: 80)),
          const SizedBox(height: 24),
          Text(
            title,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: color),
          ),
          const SizedBox(height: 16),
          const Text('Coming Soon', style: TextStyle(fontSize: 16, color: Colors.grey)),
        ],
      ),
    ),
  );
}