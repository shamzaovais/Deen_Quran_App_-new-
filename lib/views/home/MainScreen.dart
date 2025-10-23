import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_colors.dart';
import '../../viewmodels/Provider/home/homescreen_view_model.dart';
import 'HomeScreen.dart' show HomeScreen;
import 'QiblaScreen.dart';
import 'QuranScreen.dart';
import 'TasbihScreen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          body: IndexedStack(
            index: provider.currentIndex,
            children: const [
              HomeScreen(),
              QuranScreen(),
              QiblaScreen(),
              TasbihScreen(),
            ],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: const Color(0xFF0A1931), // Deep Navy Blue background
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 20,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF0A1931), // Deep Navy Blue background
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildNavItem(context, provider, 0, '🏠', 'Home'),
                          _buildNavItem(context, provider, 1, '📖', 'Quran'),
                          _buildNavItem(context, provider, 2, '🧭', 'Qibla'),
                          _buildNavItem(context, provider, 3, '📿', 'Tasbih'),
                        ],
                      ),
                    ),
                  ),
                )

              ),
            ),
          )

        );
      },
    );
  }

  Widget _buildNavItem(BuildContext context, AppProvider provider, int index, String icon, String label) {
    final isSelected = provider.currentIndex == index;
    return GestureDetector(
      onTap: () => provider.setIndex(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(icon, style: TextStyle(fontSize: isSelected ? 28 : 24)),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? AppColors.primaryBlue : Colors.grey,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}


