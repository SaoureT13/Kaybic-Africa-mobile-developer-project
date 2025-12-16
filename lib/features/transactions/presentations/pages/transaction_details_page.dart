import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/core/utils/responsive_size.dart';
import 'package:mobile/features/transactions/domain/models/transaction.dart';
import 'package:mobile/features/transactions/presentations/components/transaction_info_row.dart';
import 'package:mobile/features/transactions/presentations/components/network_detail_row.dart';
import 'package:mobile/features/transactions/presentations/components/payment_summary_row.dart';

class TransactionDetailsPage extends StatelessWidget {
  final Transaction transaction;

  const TransactionDetailsPage({super.key, required this.transaction});

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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () => context.pop(),
                    icon: const Icon(Icons.close, size: 28),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      const Text(
                        'Détails de la transaction',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                          fontFamily: 'Outfit',
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        '${transaction.amount.toStringAsFixed(0)} FCFA',
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Outfit',
                        ),
                      ),
                      const SizedBox(height: 32),
                      Container(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        decoration: BoxDecoration(
                          color: Color(0xFFEFF8FF),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            TransactionInfoRow(transaction: transaction),
                            if (transaction.senderPhone != null &&
                                transaction.fromOperator != null)
                              NetworkDetailRow(
                                label: 'Numéro Débitée',
                                phoneNumber: transaction.senderPhone!,
                                operatorName: transaction.fromOperator!,
                              ),
                            if (transaction.receiverPhone != null &&
                                transaction.toOperator != null)
                              NetworkDetailRow(
                                label: 'Numéro Destinataire',
                                phoneNumber: transaction.receiverPhone!,
                                operatorName: transaction.toOperator!,
                              ),
                            PaymentSummaryRow(transaction: transaction),
                            Container(
                              width: 48.w(context),
                              height: 48.h(context),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(99),
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/images/easytransfert_logo.png',
                                  width: 38.sp(context),
                                  height: 38.sp(context),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
