import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart'; // Important for Stripe
import 'package:saloon/pages/home.dart';
import 'package:saloon/pages/login.dart';
import 'package:saloon/pages/onboarding.dart';
import 'package:saloon/pages/signup.dart';
import 'package:saloon/services/constant.dart'; // This should contain your publishKey

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase
  await Firebase.initializeApp();

  // Initialize Stripe with your Publishable Key
  Stripe.publishableKey = publishKey; // Comes from constant.dart
  await Stripe.instance
      .applySettings(); // Required for some features (like Apple/Google Pay)

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Saloon Booking',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      // Change this to your desired starting screen
      home: const Onboarding(), // Most tutorials start with Onboarding
      // home: const Signup(),   // Or use Signup() if no onboarding
      // home: const Login(),    // Or Login() if you want login first
      routes: {
        '/home': (context) => const Home(),
        '/login': (context) => const Login(),
        '/signup': (context) => const Signup(),
        '/onboarding': (context) => const Onboarding(),
      },
    );
  }
}
