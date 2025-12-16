import 'package:flutter/material.dart';
import 'package:mobile/core/utils/date_formatter.dart';
import 'package:mobile/core/utils/responsive_size.dart';

class TransactionCard extends StatelessWidget {
  final String reference;
  final DateTime date;
  final String amount;
  final String status;
  final String? fromOperator;
  final String? toOperator;
  final VoidCallback? onTap;

  const TransactionCard({
    super.key,
    required this.reference,
    required this.date,
    required this.amount,
    required this.status,
    this.fromOperator,
    this.toOperator,
    this.onTap,
  });

  Color get statusColor {
    switch (status.toLowerCase()) {
      case 'succès':
      case 'success':
        return const Color(0xFF4CAF50);
      case 'en attente':
      case 'pending':
        return const Color(0xFFFFA500);
      case 'échoué':
      case 'failed':
        return const Color(0xFFF44336);
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: const EdgeInsets.only(
          top: 12,
          bottom: 12,
          left: 10,
          right: 10,
        ),
        decoration: BoxDecoration(
          color: Color(0xFFEFF8FF),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
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
            SizedBox(width: 12.w(context)),
            // Transaction info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    reference,
                    style: TextStyle(
                      fontSize: 14.sp(context),
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  Text(
                    DateFormatter.formatDateFr(date),
                    style: TextStyle(
                      fontSize: 12.sp(context),
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
            // Status badge
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 8.w(context),
                vertical: 4.h(context),
              ),
              decoration: BoxDecoration(
                color: statusColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: statusColor, width: 1.5.w(context)),
              ),
              child: Text(
                status,
                style: TextStyle(
                  fontSize: 10.sp(context),
                  fontWeight: FontWeight.w600,
                  color: statusColor,
                ),
              ),
            ),
            SizedBox(width: 12.w(context)),
            // Amount and operators
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  amount,
                  style: TextStyle(
                    fontSize: 16.sp(context),
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4.h(context)),
                if (fromOperator != null && toOperator != null)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildOperatorIcon(fromOperator!),
                      SizedBox(width: 4.w(context)),
                      Icon(
                        Icons.arrow_forward,
                        size: 12.sp(context),
                        color: Colors.black,
                      ),
                      SizedBox(width: 4.w(context)),
                      _buildOperatorIcon(toOperator!),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOperatorIcon(String operator) {
    return SizedBox(
      width: 24,
      height: 24,
      child: Center(
        child: Image.asset('assets/images/operators/${operator}_logo.png'),
      ),
    );
  }
}
