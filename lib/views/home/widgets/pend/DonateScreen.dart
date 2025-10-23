import 'package:deen_quran/viewmodels/Provider/home/homescreen_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/constants/app_colors.dart';

class DonateScreen extends StatelessWidget {
  const DonateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: AppColors.cream,
          appBar: AppBar(
            backgroundColor: AppColors.red,
            elevation: 0,
            title: const Text('Donate', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            centerTitle: true,
            iconTheme: const IconThemeData(color: Colors.white),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.red, AppColors.orange],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      const Text('❤️', style: TextStyle(fontSize: 60)),
                      const SizedBox(height: 16),
                      const Text(
                        'Total Donated',
                        style: TextStyle(color: Colors.white70, fontSize: 16),
                      ),
                      Text(
                        '\${provider.totalDonated.toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'This Month: \${provider.getMonthlyDonationTotal()}',
                        style: const TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          provider.addDonation(10.0, 'Masjid', 'Card');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.red,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.all(20),
                        ),
                        child: const Text('\$10'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          provider.addDonation(25.0, 'Masjid', 'Card');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.red,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.all(20),
                        ),
                        child: const Text('\$25'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          provider.addDonation(50.0, 'Masjid', 'Card');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.red,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.all(20),
                        ),
                        child: const Text('\$50'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  'Recent Donations',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.deepNavyBlue),
                ),
                const SizedBox(height: 16),
                provider.donationHistory.isEmpty
                    ? const Center(
                  child: Padding(
                    padding: EdgeInsets.all(40),
                    child: Text('No donations yet', style: TextStyle(color: Colors.grey)),
                  ),
                )
                    : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: provider.donationHistory.length,
                  itemBuilder: (context, index) {
                    final donation = provider.donationHistory[provider.donationHistory.length - 1 - index];
                    return Card(
                      child: ListTile(
                        leading: const Icon(Icons.favorite, color: AppColors.red),
                        //title: Text('\${donation['amount'].toStringAsFixed(2)}'),
                        subtitle: Text('${donation['cause']} • ${donation['method']}'),
                        trailing: Text(
                          '${donation['date'].day}/${donation['date'].month}',
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ),
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
}
