import 'package:flutter/material.dart';

class HomeHeader extends StatelessWidget {
  final String? avatarUrl;
  final VoidCallback? onNotificationTap;
  final bool hasNotifications;

  const HomeHeader({
    super.key,
    this.avatarUrl,
    this.onNotificationTap,
    this.hasNotifications = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 32,
          backgroundColor: Colors.grey[300],
          child: Image.asset(
            'assets/images/easytransfert_logo.png',
            width: 32,
            height: 32,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            'Bonjour, bienvenu sur la meilleur application de transfert d\'argent',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Outfit',
            ),
          ),
        ),
      ],
    );
  }
}
