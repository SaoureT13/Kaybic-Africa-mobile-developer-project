import 'package:mobile/features/transactions/domain/models/transaction.dart';

class TransactionDto {
  final String id;
  final String reference;
  final double amount;
  final String currency;
  final String status;
  final String? fromOperator;
  final String? toOperator;
  final String createdAt;

  TransactionDto({
    required this.id,
    required this.reference,
    required this.amount,
    required this.currency,
    required this.status,
    this.fromOperator,
    this.toOperator,
    required this.createdAt,
  });

  // Factory constructor pour créer un DTO depuis un JSON
  factory TransactionDto.fromJson(Map<String, dynamic> json) {
    return TransactionDto(
      id: json['id'] as String,
      reference: json['reference'] as String,
      amount: (json['amount'] as num).toDouble(),
      currency: json['currency'] as String? ?? 'F',
      status: json['status'] as String,
      fromOperator: json['from_operator'] as String?,
      toOperator: json['to_operator'] as String?,
      createdAt: json['created_at'] as String,
    );
  }

  // Méthode pour convertir un DTO en JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'reference': reference,
      'amount': amount,
      'currency': currency,
      'status': status,
      'from_operator': fromOperator,
      'to_operator': toOperator,
      'created_at': createdAt,
    };
  }

  // Convertir un DTO en modèle de domaine
  Transaction toModel() {
    return Transaction(
      id: id,
      reference: reference,
      amount: amount,
      currency: currency,
      status: _statusFromString(status),
      fromOperator: fromOperator,
      toOperator: toOperator,
      createdAt: DateTime.parse(createdAt),
    );
  }

  // Factory constructor pour créer un DTO depuis un modèle
  factory TransactionDto.fromModel(Transaction transaction) {
    return TransactionDto(
      id: transaction.id,
      reference: transaction.reference,
      amount: transaction.amount,
      currency: transaction.currency,
      status: _statusToString(transaction.status),
      fromOperator: transaction.fromOperator,
      toOperator: transaction.toOperator,
      createdAt: transaction.createdAt.toIso8601String(),
    );
  }

  static TransactionStatus _statusFromString(String status) {
    switch (status.toLowerCase()) {
      case 'success':
      case 'succès':
        return TransactionStatus.success;
      case 'pending':
      case 'en attente':
        return TransactionStatus.pending;
      case 'failed':
      case 'échoué':
        return TransactionStatus.failed;
      default:
        return TransactionStatus.pending;
    }
  }

  static String _statusToString(TransactionStatus status) {
    switch (status) {
      case TransactionStatus.success:
        return 'success';
      case TransactionStatus.pending:
        return 'pending';
      case TransactionStatus.failed:
        return 'failed';
    }
  }
}
