import 'package:go_router/go_router.dart';
import 'package:mobile/features/auth/presentation/pages/login_page.dart';
import 'package:mobile/features/auth/presentation/pages/on_boarding_page.dart';
import 'package:mobile/features/transactions/presentations/pages/home_page.dart';
import 'package:mobile/features/transactions/presentations/pages/transaction_details_page.dart';
import 'package:mobile/features/transactions/data/mock/transaction_mock.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        name: 'onboarding',
        builder: (context, state) => const OnBoardingPage(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: '/transactions/:id',
        name: 'transaction-detail',
        builder: (context, state) {
          final id = state.pathParameters['id']!;
          final transaction = TransactionMock.getTransactionById(id);
          if (transaction == null) {
            return const HomePage();
          }
          return TransactionDetailsPage(transaction: transaction);
        },
      ),
    ],
  );
}
