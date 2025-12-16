import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/features/auth/presentation/components/button.dart';

class OnBoardingPage extends StatelessWidget {
  const OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/on_boarding_background.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                right: 24.0,
                bottom: 80.0,
              ),
              child: Column(
                children: [
                  const Spacer(flex: 2),
                  Column(
                    children: [
                      Text(
                        'easy',
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 0.9,
                        ),
                      ),
                      Text(
                        'Transfert',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                          height: 0.9,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 120),
                  RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 22,
                        color: Colors.white.withValues(alpha: 0.9),
                        fontWeight: FontWeight.bold,
                        height: 1.3,
                        fontFamily: "Outfit",
                      ),
                      children: [
                        const TextSpan(
                          text: 'La meilleure façon de ',
                          style: TextStyle(color: Color(0xFF7BCEFE)),
                        ),
                        TextSpan(text: 'transférer de l\'argent'),
                        const TextSpan(
                          text: ' en toute sécurité',
                          style: TextStyle(color: Color(0xFF7BCEFE)),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(flex: 3),
                  Button(
                    text: 'Commencer',
                    onPressed: () {
                      context.go('/login');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
