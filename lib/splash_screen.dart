import 'dart:async';
import 'package:flutter/material.dart';
import "login_page.dart";

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool moveToCenter = false;
  bool showImageAndText = false;

  @override
  void initState() {
    super.initState();

    // Start icon animations
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        moveToCenter = true;
      });
    });

    // Replace icons with image + text after animation
    Future.delayed(const Duration(seconds: 7), () {
      setState(() {
        showImageAndText = true;
      });
    });

    // Navigate to Login screen
    Future.delayed(const Duration(seconds: 9), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final centerX = screenWidth / 2 - 24;
    final centerY = screenHeight / 2 - 24;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          if (!showImageAndText) ...[
            AnimatedPositioned(
              duration: const Duration(seconds: 3),
              left: moveToCenter ? centerX : -100,
              top: centerY,
              child: Icon(Icons.train, size: 48, color: Colors.blue),
            ),

            AnimatedPositioned(
              duration: const Duration(seconds: 3),
              left: moveToCenter ? centerX : screenWidth,
              top: moveToCenter ? centerY : -100,
              child: Icon(
                Icons.airplanemode_active,
                size: 48,
                color: Colors.red,
              ),
            ),

            AnimatedPositioned(
              duration: const Duration(seconds: 3),
              left: moveToCenter ? centerX : screenWidth,
              top: moveToCenter ? centerY : screenHeight + 100,
              child: Icon(Icons.directions_bus, size: 48, color: Colors.green),
            ),
          ] else
            // Replace with image + text + loading at center
            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage("images/travel.webp"),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    "GoTravel",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const CircularProgressIndicator(
                    strokeWidth: 3,
                    color: Colors.blueAccent,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
