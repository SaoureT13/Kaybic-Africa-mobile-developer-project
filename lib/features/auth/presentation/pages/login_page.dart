import 'package:flutter/material.dart';
import 'package:mobile/features/auth/presentation/components/login_form.dart';
import 'package:mobile/core/utils/responsive_size.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFF7FE),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(19.0, 0.0, 19.0, 10.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 20, top: 20),
                        child: Column(
                          children: [
                            Text(
                              "Connectez-vous et commencez à \ntransferer",
                              style: TextStyle(
                                fontSize: 28.w(context),
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                height: 1.2.h(context),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h(context)),
                      const LoginForm(),
                      SizedBox(height: 20.h(context)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
