import 'package:deen_quran/routes/names.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../core/constants/app_colors.dart' show AppColors;
import '../../viewmodels/Provider/home/homescreen_view_model.dart' show AppProvider;

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isTablet = size.width > 600;

    return Consumer<AppProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: AppColors.deepNavyBlue,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Builder(
              builder: (context) => IconButton(
                icon: const Icon(Icons.menu, color: Colors.white),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            title: const Text(
              'DEEN MUSLIM',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                icon: const Icon(Icons.search, color: Colors.white),
                onPressed: () {
                  Navigator.pushNamed(context, RoutesName.login);
                },
              ),
            ],
          ),
          drawer: _buildDrawer(context, provider),
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(isTablet ? 32.0 : 16.0),
              child: Column(
                children: [
                  _buildPrayerTimeCard(context, provider, isTablet),
                  SizedBox(height: isTablet ? 32 : 24),
                  _buildFeatureGrid(context, isTablet),
                  SizedBox(height: isTablet ? 32 : 24),
                  _buildPrayerTimesSection(context, provider, isTablet),
                ],
              ),
            ),
          ),
        );
      },
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
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      onTap: () {
        Navigator.pop(context);
        provider.setRoute(route);
        Navigator.pushNamed(context, route);
      },
    );
  }

  Widget _buildPrayerTimeCard(BuildContext context, AppProvider provider, bool isTablet) {
    return Container(
      padding: EdgeInsets.all(isTablet ? 32 : 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.deepNavyBlue.withOpacity(0.95),
            AppColors.primaryBlue.withOpacity(0.85),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryBlue.withOpacity(0.4),
            blurRadius: 25,
            spreadRadius: 2,
            offset: const Offset(0, 8),
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 30,
            offset: const Offset(0, 15),
          ),
        ],
        border: Border.all(
          color: Colors.white.withOpacity(0.15),
          width: 1.2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Current Time
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildTimeDigit(provider.currentTime.hour.toString().padLeft(2, '0'), isTablet),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  ':',
                  style: TextStyle(
                    fontSize: isTablet ? 72 : 56,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        blurRadius: 15,
                        color: Colors.white.withOpacity(0.5),
                        offset: const Offset(0, 3),
                      )
                    ],
                  ),
                ),
              ),
              _buildTimeDigit(provider.currentTime.minute.toString().padLeft(2, '0'), isTablet),
            ],
          ),

          SizedBox(height: isTablet ? 24 : 18),

          // Divider line with glow
          Container(
            width: double.infinity,
            height: 11,
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white.withOpacity(0),
                  Colors.white.withOpacity(0.3),
                  Colors.white.withOpacity(0),
                ],
              ),
            ),
          ),

          // Info Section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildInfoColumn('REMAINING TIME', provider.nextPrayerTime, isTablet),
              Container(width: 1, height: isTablet ? 50 : 40, color: Colors.white30),
              _buildInfoColumn(provider.currentDate, provider.location, isTablet),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTimeDigit(String digit, bool isTablet) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: isTablet ? 24 : 16, vertical: isTablet ? 16 : 12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
        digit,
        style: TextStyle(
          fontSize: isTablet ? 72 : 56,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildInfoColumn(String title, String value, bool isTablet) {
    return Column(
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white70,
            fontSize: isTablet ? 14 : 11,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: isTablet ? 8 : 4),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: isTablet ? 18 : 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildFeatureGrid(BuildContext context, bool isTablet) {
    final features = [
      {'icon': '🔔', 'label': 'Reminder', 'color': AppColors.primaryBlue, 'route': '/reminder'},
      {'icon': '💡', 'label': 'Memorize', 'color': Colors.orangeAccent, 'route': '/memorize'},
      {'icon': '🎵', 'label': 'Ruqiyah', 'color': Colors.cyanAccent, 'route': '/ruqiyah'},
      {'icon': '🤲', 'label': 'Dua QSA', 'color': Colors.greenAccent, 'route': '/dua_qsa'},
      {'icon': '📚', 'label': 'Books', 'color': Colors.lightBlueAccent, 'route': '/books'},
      {'icon': '❤️', 'label': 'Donate', 'color': Colors.pinkAccent, 'route': '/donate'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: isTablet ? 4 : 3,
        crossAxisSpacing: isTablet ? 24 : 16,
        mainAxisSpacing: isTablet ? 24 : 16,
        childAspectRatio: 1,
      ),
      itemCount: features.length,
      itemBuilder: (context, index) {
        final feature = features[index];
        return GestureDetector(
          onTap: () => Navigator.pushNamed(context, feature['route'] as String),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.deepNavyBlue.withOpacity(0.9),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: (feature['color'] as Color).withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(feature['icon'] as String, style: TextStyle(fontSize: isTablet ? 36 : 28)),
                SizedBox(height: isTablet ? 12 : 8),
                Text(
                  feature['label'] as String,
                  style: TextStyle(
                    fontSize: isTablet ? 16 : 13,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildPrayerTimesSection(BuildContext context, AppProvider provider, bool isTablet) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Prayer Times',
          style: TextStyle(
            fontSize: isTablet ? 28 : 22,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: isTablet ? 20 : 16),

        // 🔹 Carousel Slider for smooth auto animation
        CarouselSlider(
          options: CarouselOptions(
            height: isTablet ? 200 : 160,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 0.55,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayCurve: Curves.easeInOut,
          ),
          items: provider.prayerTimes.asMap().entries.map((entry) {
            final index = entry.key;
            final prayer = entry.value;
            final isActive = provider.prayerStatus[index]; // ✅ now index is valid

            return GestureDetector(
              onTap: () => provider.togglePrayerStatus(index),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 6),
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                decoration: BoxDecoration(
                  color: isActive
                      ? AppColors.deepNavyBlue.withOpacity(0.95)
                      : AppColors.primaryBlue.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(prayer['icon'], style: const TextStyle(fontSize: 36)),
                    const SizedBox(height: 8),
                    Text(
                      prayer['name'],
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      prayer['time'],
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
