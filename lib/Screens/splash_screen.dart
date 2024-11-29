import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grad_project/Screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/splashScreen';
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  double _scale = 0.8;
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // Start the animations after the first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        _scale = 1.0;
        _opacity = 1.0; // Set opacity to full for fade-in effect
      });
    });

    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, WelcomeScreen.routeName);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2260FF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedScale(
              scale: _scale,
              duration: const Duration(seconds: 2),
              curve: Curves.easeInOut,
              child: Image.asset(
                'assets/images/logo1.png',
                width: 200,
                height: 200, // Adjust the size for a good visual balance
              ),
            ),
            const SizedBox(height: 20),
            AnimatedOpacity(
              opacity: _opacity,
              duration: const Duration(seconds: 2),
              child: Column(
                children: [
                  Text(
                    'Care', // Medical app name
                    style: GoogleFonts.leagueSpartan(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.w100,
                      height: 1,
                    ),
                  ),
                  Text(
                    'Blossom', // Medical app name
                    style: GoogleFonts.leagueSpartan(
                      color: Colors.white,
                      fontSize: 48,
                      fontWeight: FontWeight.w100,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Your Health, Our Priority', // Tagline or slogan
                    style: GoogleFonts.leagueSpartan(
                      color: Colors.white70,
                      fontSize: 35,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
