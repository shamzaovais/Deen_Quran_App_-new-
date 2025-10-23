import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

import '../../core/constants/app_colors.dart';
import '../../viewmodels/Provider/home/Qibla_view_model.dart' show QiblaProvider;

class QiblaScreen extends StatelessWidget {
  const QiblaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isSmall = size.width < 400;

    return Scaffold(
      backgroundColor: AppColors.deepNavyBlue,
      appBar: AppBar(
      backgroundColor: AppColors.deepNavyBlue,
      elevation: 0,
      title: const Text(
        'Qibla Finder',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      iconTheme: const IconThemeData(color: Colors.white),
    ),
      body: Consumer<QiblaProvider>(
        builder: (context, qibla, _) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Compass circle
                Container(
                  width: isSmall ? 250 : 320,
                  height: isSmall ? 250 : 320,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [Color(0xFF185ADB), Color(0xFF0A1931)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 8,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Transform.rotate(
                        angle: (qibla.direction ?? 0) * (math.pi / 180) * -1,
                        child: CustomPaint(
                          painter: CompassPainter(),
                          size: Size(isSmall ? 250 : 320, isSmall ? 250 : 320),
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_up,
                        color: Colors.orangeAccent,
                        size: isSmall ? 40 : 50,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  '${qibla.qiblaDirection.toStringAsFixed(0)}°',
                  style: const TextStyle(
                    fontSize: 28,
                    color: Color(0xFF384C6C),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  "Device's angle to Qibla",
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 24),
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF185ADB).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    qibla.rotationText,
                    style: const TextStyle(
                      color: Color(0xFF185ADB),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

// 🔥 Redesigned Compass Painter (UI only)
class CompassPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;

    // Outer gradient ring
    final ringPaint = Paint()
      ..shader = SweepGradient(
        colors: [
          const Color(0xFF185ADB),
          const Color(0xFF0A1931),
          const Color(0xFF185ADB),
        ],
        startAngle: 0,
        endAngle: 2 * math.pi,
      ).createShader(Rect.fromCircle(center: center, radius: radius))
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6;
    canvas.drawCircle(center, radius, ringPaint);

    // Inner glow
    final glowPaint = Paint()
      ..color = const Color(0xFF185ADB).withOpacity(0.3)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);
    canvas.drawCircle(center, radius - 15, glowPaint);

    // Directions (N, E, S, W)
    final directions = ['N', 'E', 'S', 'W'];
    final textPainter = TextPainter(
      textAlign: TextAlign.center,
      textDirection: TextDirection.ltr,
    );

    for (int i = 0; i < 4; i++) {
      final angle = (i * 90) * (math.pi / 180);
      final dx = center.dx + (radius - 25) * math.cos(angle);
      final dy = center.dy + (radius - 25) * math.sin(angle);

      textPainter.text = TextSpan(
        text: directions[i],
        style: TextStyle(
          color: directions[i] == 'N'
              ? const Color(0xFFFFC947)
              : Colors.white.withOpacity(0.9),
          fontSize: directions[i] == 'N' ? 20 : 16,
          fontWeight: FontWeight.bold,
          shadows: [
            Shadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 4,
              offset: const Offset(1, 1),
            ),
          ],
        ),
      );
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(dx - textPainter.width / 2, dy - textPainter.height / 2),
      );
    }

    // Center glow and dot
    final centerGlow = Paint()
      ..color = const Color(0xFF185ADB).withOpacity(0.4)
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);
    canvas.drawCircle(center, 8, centerGlow);

    final centerDot = Paint()..color = const Color(0xFF185ADB);
    canvas.drawCircle(center, 4, centerDot);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
