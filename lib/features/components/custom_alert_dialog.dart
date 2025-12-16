import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final VoidCallback onPrimaryPressed;
  final String primaryButtonText;
  final VoidCallback? onSecondaryPressed;
  final String? secondaryButtonText;

  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.content,
    required this.onPrimaryPressed,
    this.primaryButtonText = 'OK',
    this.onSecondaryPressed,
    this.secondaryButtonText,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.0)),
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        width: 270, // Standard width for this type of dialog
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: .9),
          borderRadius: BorderRadius.circular(14.0),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20.0,
                left: 16.0,
                right: 16.0,
                bottom: 20.0,
              ),
              child: Column(
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                  ),
                  // const SizedBox(height: 4),
                  // Text(
                  //   content,
                  //   textAlign: TextAlign.center,
                  //   style: const TextStyle(fontSize: 13, color: Colors.black87),
                  // ),
                ],
              ),
            ),
            Divider(height: 0.5, thickness: 0.5, color: Colors.grey),
            _buildButton(
              text: primaryButtonText,
              onPressed: onPrimaryPressed,
              isBold: true,
              context: context,
            ),
            if (onSecondaryPressed != null && secondaryButtonText != null) ...[
              Divider(
                height: 0.5,
                thickness: 0.5,
                color: Colors.black.withValues(alpha: .1),
              ),
              _buildButton(
                text: secondaryButtonText!,
                onPressed: onSecondaryPressed!,
                isBold: false,
                context: context,
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildButton({
    required String text,
    required VoidCallback onPressed,
    bool isBold = false,
    required BuildContext context,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 17,
            fontWeight: isBold ? FontWeight.w600 : FontWeight.w400,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
