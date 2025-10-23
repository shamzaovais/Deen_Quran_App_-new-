import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants/app_colors.dart';
import '../../viewmodels/Provider/home/Tasbih_view_model.dart';

class TasbihScreen extends StatelessWidget {
  const TasbihScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TasbihProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: AppColors.deepNavyBlue, // 🩵 background
          appBar: AppBar(
            backgroundColor: AppColors.deepNavyBlue,
            elevation: 0,
            title: const Text(
              'Tasbih Counter',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            iconTheme: const IconThemeData(color: Colors.white),
            actions: [
              IconButton(
                icon: const Icon(Icons.refresh),
                onPressed: provider.resetTasbih,
              ),
            ],
          ),
          body: Center(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Current Tasbih Selection Box
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: AppColors.primaryBlue.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryBlue.withOpacity(0.3),
                          blurRadius: 20,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          provider.currentTasbih,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: List.generate(
                            provider.tasbihList.length,
                                (index) => GestureDetector(
                              onTap: () => provider.changeTasbih(index),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  color: provider.currentTasbihIndex == index
                                      ? AppColors.primaryBlue
                                      : AppColors.primaryBlue.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  provider.tasbihList[index],
                                  style: TextStyle(
                                    color: provider.currentTasbihIndex == index
                                        ? Colors.white
                                        : Colors.white70,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )

                      ],
                    ),
                  ),
                  const SizedBox(height: 40),

                  // Progress Ring
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 200,
                        height: 200,
                        child: CircularProgressIndicator(
                          value: provider.tasbihProgress,
                          strokeWidth: 12,
                          backgroundColor: Colors.white24,
                          valueColor:
                          const AlwaysStoppedAnimation<Color>(AppColors.primaryBlue),
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            '${provider.tasbihCount}',
                            style: const TextStyle(
                              fontSize: 72,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'of ${provider.tasbihTarget}',
                            style: const TextStyle(
                              fontSize: 18,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  const SizedBox(height: 60),

                  // TAP Button
                  GestureDetector(
                    onTap: provider.incrementTasbih,
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            AppColors.primaryBlue,
                            AppColors.primaryBlue.withOpacity(0.8)
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.primaryBlue.withOpacity(0.4),
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Text(
                          'TAP',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
