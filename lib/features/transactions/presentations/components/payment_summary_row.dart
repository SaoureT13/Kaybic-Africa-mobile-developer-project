import 'package:flutter/material.dart';
import 'package:mobile/features/transactions/domain/models/transaction.dart';

class PaymentSummaryRow extends StatelessWidget {
  final Transaction transaction;
  final bool hasDivider;

  const PaymentSummaryRow({
    super.key,
    required this.transaction,
    this.hasDivider = false,
  });

  Color get statusColor {
    switch (transaction.status) {
      case TransactionStatus.success:
        return const Color(0xFF4CAF50);
      case TransactionStatus.pending:
        return const Color(0xFFFFA500);
      case TransactionStatus.failed:
        return const Color(0xFFF44336);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Column(
            children: [
              // Montant Envoyé
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Montant Envoyé',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                      fontFamily: 'Outfit',
                    ),
                  ),
                  Text(
                    '${transaction.amount.toStringAsFixed(0)} FCFA',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontFamily: 'Outfit',
                    ),
                  ),
                ],
              ),
              if (transaction.receivedAmount != null) ...[
                const SizedBox(height: 16),
                // Montant reçu
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Montant reçu',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                        fontFamily: 'Outfit',
                      ),
                    ),
                    Text(
                      transaction.formattedAmount,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontFamily: 'Outfit',
                      ),
                    ),
                  ],
                ),
              ],
              const SizedBox(height: 16),
              // Statut du paiement
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Statut du paiement',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                      fontFamily: 'Outfit',
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: statusColor.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: statusColor, width: 1.5),
                    ),
                    child: Text(
                      transaction.statusLabel ?? transaction.statusText,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: statusColor,
                        fontFamily: 'Outfit',
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        if (hasDivider)
          CustomPaint(
            size: const Size(double.infinity, 1),
            painter: DashedLinePainter(),
          ),
      ],
    );
  }
}

class DashedLinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey[300]!
      ..strokeWidth = 1;

    const dashWidth = 5.0;
    const dashSpace = 3.0;
    double startX = 0;

    while (startX < size.width) {
      canvas.drawLine(Offset(startX, 0), Offset(startX + dashWidth, 0), paint);
      startX += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
