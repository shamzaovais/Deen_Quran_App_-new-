import 'package:flutter/material.dart';

class TasbihProvider extends ChangeNotifier {
  int tasbihCount = 0;
  int tasbihTarget = 100;
  int currentTasbihIndex = 0;

  final List<String> tasbihList = [
    'SubhanAllah',
    'Alhamdulillah',
    'Allahu Akbar',
    'Anything'
  ];

  String get currentTasbih => tasbihList[currentTasbihIndex];

  double get tasbihProgress => tasbihCount / tasbihTarget;

  void incrementTasbih() {
    if (tasbihCount < tasbihTarget) {
      tasbihCount++;
    } else {
      // Auto switch to next tasbih
      if (currentTasbihIndex < tasbihList.length - 1) {
        currentTasbihIndex++;
        tasbihCount = 0;
      } else {
        currentTasbihIndex = 0;
        tasbihCount = 0;
      }
    }
    notifyListeners();
  }

  void resetTasbih() {
    tasbihCount = 0;
    currentTasbihIndex = 0;
    notifyListeners();
  }

  void changeTasbih(int index) {
    currentTasbihIndex = index;
    tasbihCount = 0;
    notifyListeners();
  }
}
