class Transaction {
  final String id;
  final String reference;
  final double amount;
  final String currency;
  final TransactionStatus status;
  final String? fromOperator;
  final String? toOperator;
  final DateTime createdAt;
  final String? senderPhone;
  final String? receiverPhone;
  final double? receivedAmount;
  final String? statusLabel;

  Transaction({
    required this.id,
    required this.reference,
    required this.amount,
    this.currency = 'F',
    required this.status,
    this.fromOperator,
    this.toOperator,
    required this.createdAt,
    this.senderPhone,
    this.receiverPhone,
    this.receivedAmount,
    this.statusLabel,
  });

  String get formattedAmount {
    final amountStr = amount.toStringAsFixed(0);
    if (amountStr.length <= 3) {
      return '$amountStr $currency';
    }

    final parts = <String>[];
    int remaining = amountStr.length;

    while (remaining > 0) {
      final start = remaining > 3 ? remaining - 3 : 0;
      parts.insert(0, amountStr.substring(start, remaining));
      remaining = start;
    }

    return '${parts.join(' ')} $currency';
  }

  String get statusText {
    switch (status) {
      case TransactionStatus.success:
        return 'Succès';
      case TransactionStatus.pending:
        return 'En attente';
      case TransactionStatus.failed:
        return 'Échoué';
    }
  }

  Transaction copyWith({
    String? id,
    String? reference,
    String? date,
    double? amount,
    String? currency,
    TransactionStatus? status,
    String? fromOperator,
    String? toOperator,
    DateTime? createdAt,
    String? senderPhone,
    String? receiverPhone,
    double? receivedAmount,
    String? statusLabel,
  }) {
    return Transaction(
      id: id ?? this.id,
      reference: reference ?? this.reference,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      status: status ?? this.status,
      fromOperator: fromOperator ?? this.fromOperator,
      toOperator: toOperator ?? this.toOperator,
      createdAt: createdAt ?? this.createdAt,
      senderPhone: senderPhone ?? this.senderPhone,
      receiverPhone: receiverPhone ?? this.receiverPhone,
      receivedAmount: receivedAmount ?? this.receivedAmount,
      statusLabel: statusLabel ?? this.statusLabel,
    );
  }
}

enum TransactionStatus { success, pending, failed }
