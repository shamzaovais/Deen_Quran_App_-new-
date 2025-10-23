import 'package:deen_quran/routes/Generator.dart' show Routes;
import 'package:deen_quran/routes/names.dart' show RoutesName;
import 'package:deen_quran/viewmodels/Provider/auth/LoginViewModel.dart';
import 'package:deen_quran/viewmodels/Provider/auth/Spalsh.dart';
import 'package:deen_quran/viewmodels/Provider/auth/otp_view_model.dart';
import 'package:deen_quran/viewmodels/Provider/auth/reset_password_view_model.dart';
import 'package:deen_quran/viewmodels/Provider/home/Qibla_view_model.dart';
import 'package:deen_quran/viewmodels/Provider/home/Tasbih_view_model.dart';
import 'package:deen_quran/viewmodels/Provider/home/homescreen_view_model.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MultiProvider is used to provide multiple ViewModels to the widget tree.
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SplashViewModel()),
        ChangeNotifierProvider(create: (_) => OTPViewModel()),
        ChangeNotifierProvider(create: (_) => ResetPasswordViewModel()),
        ChangeNotifierProvider(create: (_) => LoginViewModel()),
        ChangeNotifierProvider(create: (_) => AppProvider()),
        ChangeNotifierProvider(create: (_) => QiblaProvider()),
        ChangeNotifierProvider(create: (_) => TasbihProvider()),
        // Add other providers for other ViewModels here
      ],
      child: MaterialApp(
        title: 'Deen app',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // The initial route is the splash screen.
        initialRoute: RoutesName.splash,
        // The onGenerateRoute callback handles all navigation.
        onGenerateRoute: Routes.generateRoute,
      ),
    );
  }
}
