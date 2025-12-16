import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile/features/transactions/presentations/components/home_header.dart';
import 'package:mobile/features/transactions/presentations/components/transaction_card.dart';
import 'package:mobile/features/transactions/data/mock/transaction_mock.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _displayLimit = 3;
  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      if (_isExpanded) {
        _displayLimit = 3;
      } else {
        _displayLimit = 8;
      }
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    final transactions = TransactionMock.getTransactions(limit: _displayLimit);

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/home_background.png',
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
                right: 10.0,
                top: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Header fixe
                  HomeHeader(hasNotifications: true),
                  const SizedBox(height: 32),
                  // Titre Transactions fixe
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Transactions',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontFamily: 'Outfit',
                        ),
                      ),
                      TextButton(
                        onPressed: _toggleExpanded,
                        child: Text(
                          _isExpanded ? 'Voir moins' : 'Voir plus',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Color(0xFF1768AB),
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Outfit',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Liste scrollable des transactions
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: transactions.map((transaction) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12),
                            child: TransactionCard(
                              reference: transaction.reference,
                              date: transaction.createdAt,
                              amount: transaction.formattedAmount,
                              status: transaction.statusText,
                              fromOperator: transaction.fromOperator,
                              toOperator: transaction.toOperator,
                              onTap: () {
                                context.push('/transactions/${transaction.id}');
                              },
                            ),
                          );
                        }).toList(),
                      ),
                    ),
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
