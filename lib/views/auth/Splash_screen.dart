import 'package:deen_quran/viewmodels/Provider/auth/Spalsh.dart' show SplashViewModel;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// This is the View for the splash screen.
// It's a "dumb" widget that only displays the UI and calls the ViewModel.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final splashViewModel = Provider.of<SplashViewModel>(context, listen: false);
    splashViewModel.handleSplashLogic(context);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF0A2342), // A nice deep blue
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // You can replace this with your app's logo
            Icon(Icons.query_stats, size: 100, color: Colors.white),
            SizedBox(height: 24),
            Text(
              'Quran App',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 48),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
