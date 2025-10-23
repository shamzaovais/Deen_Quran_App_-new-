import 'package:flutter/material.dart';
import 'package:flutter_compass/flutter_compass.dart';


class QiblaProvider extends ChangeNotifier {
  double? direction;
  double qiblaDirection = 257; // Example Qibla direction (can be dynamic later)

  QiblaProvider() {
    FlutterCompass.events!.listen((event) {
      direction = event.heading;
      notifyListeners();
    });
  }

  double get angleToQibla {
    if (direction == null) return 0;
    return (qiblaDirection - direction!).abs();
  }

  String get rotationText {
    if (angleToQibla < 5) return 'You are facing Qibla';
    return 'Rotate the phone ${angleToQibla.toStringAsFixed(0)}° to the left';
  }
}
