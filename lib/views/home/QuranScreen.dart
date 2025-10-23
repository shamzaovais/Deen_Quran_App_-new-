import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_colors.dart';
import '../../viewmodels/Provider/home/homescreen_view_model.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;

    return Consumer<AppProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: AppColors.deepNavyBlue, // 🔵 Dark blue background
          appBar: AppBar(
            backgroundColor: AppColors.deepNavyBlue, // 🔵 Brighter blue bar
            elevation: 0,
            leading: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            title: const Text(
              'QURAN',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.white),
                onPressed: () {},
              ),
            ],
          ),
          drawer: _buildDrawer(context, provider),
          body: SingleChildScrollView(
            padding: EdgeInsets.all(isTablet ? 32.0 : 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Last Read Card
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.primaryBlue.withOpacity(0.4),
                        AppColors.primaryBlue.withOpacity(0.7),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Last Read',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white.withOpacity(0.8),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Text(
                            'Al-Fatiah',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Ayah No: 1',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.all(20),
                        child: const Icon(
                          Icons.mosque,
                          size: 80,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Tabs
                Row(
                  children: [
                    const Text(
                      'Al Quran',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 20),
                    _buildTab('Surah', true),
                    const SizedBox(width: 12),
                    _buildTab('Juz', false),
                    const SizedBox(width: 12),
                    _buildTab('Page', false),
                  ],
                ),
                const SizedBox(height: 20),

                // Surah List
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return _buildSurahItem(
                      context,
                      index + 1,
                      index == 0
                          ? 'Al Fatiha'
                          : index == 1
                          ? 'Al Baqarah'
                          : index == 2
                          ? 'Ali Imran'
                          : index == 3
                          ? 'An Nisa'
                          : 'Al Maidah',
                      index == 0
                          ? 7
                          : index == 1
                          ? 286
                          : index == 2
                          ? 200
                          : index == 3
                          ? 176
                          : 120,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTab(String title, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? AppColors.primaryBlue.withOpacity(0.3) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 14,
          fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
          color: isActive ? Colors.white : Colors.white60,
        ),
      ),
    );
  }

  Widget _buildSurahItem(BuildContext context, int number, String name, int ayahs) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryBlue.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.primaryBlue.withOpacity(0.3),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Center(
              child: Text(
                number.toString().padLeft(2, '0'),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    const Icon(Icons.book, size: 14, color: Colors.white70),
                    const SizedBox(width: 4),
                    Text(
                      '$ayahs Ayahs',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Text(
            'ٱلْفَاتِحَة',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDrawer(BuildContext context, AppProvider provider) {
    return Drawer(
      child: Container(
        color: AppColors.deepNavyBlue,
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 40),
              const CircleAvatar(
                radius: 50,
                backgroundColor: AppColors.primaryBlue,
                child: Icon(Icons.person, size: 50, color: Colors.white),
              ),
              const SizedBox(height: 16),
              const Text(
                'Deen Muslim',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                provider.location,
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
              const SizedBox(height: 32),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    _buildDrawerItem(context, provider, Icons.home, 'Home', '/home'),
                    _buildDrawerItem(context, provider, Icons.book, 'Quran', '/quran'),
                    _buildDrawerItem(context, provider, Icons.explore, 'Qibla', '/qibla'),
                    _buildDrawerItem(context, provider, Icons.radio_button_checked, 'Tasbih', '/tasbih'),
                    _buildDrawerItem(context, provider, Icons.notifications, 'Reminder', '/reminder'),
                    _buildDrawerItem(context, provider, Icons.library_books, 'Memorize', '/memorize'),
                    _buildDrawerItem(context, provider, Icons.healing, 'Ruqiyah', '/ruqiyah'),
                    _buildDrawerItem(context, provider, Icons.menu_book, 'Dua & QSA', '/dua_qsa'),
                    _buildDrawerItem(context, provider, Icons.book_outlined, 'Books', '/books'),
                    _buildDrawerItem(context, provider, Icons.favorite, 'Donate', '/donate'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDrawerItem(BuildContext context, AppProvider provider, IconData icon, String title, String route) {
    return ListTile(
      leading: Icon(icon, color: AppColors.primaryBlue),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: () {
        Navigator.pop(context);
        provider.setRoute(route);
        Navigator.pushNamed(context, route);
      },
    );
  }
}
