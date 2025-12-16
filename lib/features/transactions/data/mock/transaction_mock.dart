import 'package:mobile/features/transactions/domain/models/transaction.dart';

class TransactionMock {
  static final List<Transaction> transactions = [
    Transaction(
      id: '1',
      reference: 'EFB.33286450',
      amount: 6200,
      status: TransactionStatus.success,
      fromOperator: 'orange',
      toOperator: 'wave',
      createdAt: DateTime(2025, 9, 14, 12, 25, 46),
      senderPhone: '2250704319965',
      receiverPhone: '0708062982',
      statusLabel: 'Envoyé',
    ),
    Transaction(
      id: '2',
      reference: 'EFB.33012831',
      amount: 5185,
      status: TransactionStatus.success,
      fromOperator: 'orange',
      toOperator: 'wave',
      createdAt: DateTime(2025, 9, 9, 14, 30, 12),
      senderPhone: '2250701234567',
      receiverPhone: '0709876543',
      statusLabel: 'Envoyé',
    ),
    Transaction(
      id: '3',
      reference: 'EFB.28795980',
      amount: 12400,
      status: TransactionStatus.success,
      fromOperator: 'orange',
      toOperator: 'wave',
      createdAt: DateTime(2025, 5, 27, 9, 15, 30),
      senderPhone: '2250705555555',
      receiverPhone: '0701111111',
      statusLabel: 'Envoyé',
    ),
    Transaction(
      id: '4',
      reference: 'EFB.28123456',
      amount: 8500,
      status: TransactionStatus.pending,
      fromOperator: 'mtn',
      toOperator: 'orange',
      createdAt: DateTime(2025, 4, 15, 16, 45, 20),
      senderPhone: '2250754321098',
      receiverPhone: '0707654321',
      statusLabel: 'En cours',
    ),
    Transaction(
      id: '5',
      reference: 'EFB.27654321',
      amount: 15000,
      status: TransactionStatus.failed,
      fromOperator: 'wave',
      toOperator: 'mtn',
      createdAt: DateTime(2025, 3, 3, 11, 20, 45),
      senderPhone: '2250708888888',
      receiverPhone: '0755555555',
      statusLabel: 'Échoué',
    ),
    Transaction(
      id: '6',
      reference: 'EFB.26789012',
      amount: 3200,
      status: TransactionStatus.success,
      fromOperator: 'orange',
      toOperator: 'moov',
      createdAt: DateTime(2025, 2, 20, 13, 10, 15),
      senderPhone: '2250702222222',
      receiverPhone: '0101234567',
      statusLabel: 'Envoyé',
    ),
    Transaction(
      id: '7',
      reference: 'EFB.25456789',
      amount: 9800,
      status: TransactionStatus.success,
      fromOperator: 'mtn',
      toOperator: 'wave',
      createdAt: DateTime(2025, 1, 10, 8, 30, 50),
      senderPhone: '2250756789012',
      receiverPhone: '0709999999',
      statusLabel: 'Envoyé',
    ),
    Transaction(
      id: '8',
      reference: 'EFB.24123987',
      amount: 7500,
      status: TransactionStatus.pending,
      fromOperator: 'wave',
      toOperator: 'orange',
      createdAt: DateTime(2024, 12, 28, 17, 55, 30),
      senderPhone: '2250703333333',
      receiverPhone: '0704444444',
      statusLabel: 'En cours',
    ),
    Transaction(
      id: '9',
      reference: 'EFB.23987654',
      amount: 4200,
      status: TransactionStatus.pending,
      fromOperator: 'moov',
      toOperator: 'wave',
      createdAt: DateTime(2024, 11, 15, 10, 25, 10),
      senderPhone: '2250101111111',
      receiverPhone: '0708888888',
      statusLabel: 'En cours',
    ),
    Transaction(
      id: '10',
      reference: 'EFB.22876543',
      amount: 11000,
      status: TransactionStatus.success,
      fromOperator: 'orange',
      toOperator: 'mtn',
      createdAt: DateTime(2024, 10, 5, 15, 40, 25),
      senderPhone: '2250706666666',
      receiverPhone: '0757777777',
      statusLabel: 'Envoyé',
    ),
  ];

  // Méthode pour obtenir les transactions
  static List<Transaction> getTransactions({int limit = 3}) {
    return transactions.take(limit).toList();
  }

  // Méthode pour obtenir une transaction par ID
  static Transaction? getTransactionById(String id) {
    try {
      return transactions.firstWhere((t) => t.id == id);
    } catch (e) {
      return null;
    }
  }

  // Méthode pour filtrer par statut
  static List<Transaction> getTransactionsByStatus(TransactionStatus status) {
    return transactions.where((t) => t.status == status).toList();
  }
}
