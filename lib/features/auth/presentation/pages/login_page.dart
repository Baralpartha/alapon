import 'package:flutter/material.dart';
import '../../../../core/routes/app_routes.dart';
import '../widgets/auth_background.dart';
import '../widgets/auth_text_field.dart';
import '../widgets/auth_primary_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthBackground(
      bottomAsset: 'assets/images/auth_bottom_illustration.png',
      bottomHeight: 190,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: IntrinsicHeight(
          child: Column(
            children: [
              const SizedBox(height: 10),

              Row(
                children: [

                  const Expanded(child: Center(child: _BrandTitle())),
                  const SizedBox(width:50),
                ],
              ),

              const Spacer(flex: 1), //

              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  color: Color(0xFF7E2A2A),
                ),
              ),

              const SizedBox(height: 25),


              const AuthTextField(
                hint: "Email",
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 12),
              const AuthTextField(
                hint: "Password",
                obscure: true,
              ),

              const SizedBox(height: 20),

              AuthPrimaryButton(
                text: "Login",
                onTap: () {
                  Navigator.pushReplacementNamed(context, AppRoutes.home);


                },
              ),

              const SizedBox(height: 15),

              // সাইন আপ লিংক
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account? ",
                    style: TextStyle(
                      color: Color(0xFF8B5C5C),
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      // Navigator.pushNamed(context, '/signup');
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Color(0xFFD94141),
                        fontWeight: FontWeight.w900,
                        fontSize: 13,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),

              const Spacer(flex: 2),


              const SizedBox(height: 170),
            ],
          ),
        ),
      ),
    );
  }
}

class _BrandTitle extends StatelessWidget {
  const _BrandTitle();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: const [
        Icon(Icons.bolt_rounded, color: Color(0xFFD94141), size: 22),
        SizedBox(width: 4),
        Text(
          "Alapon",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: Color(0xFFD94141),
          ),
        ),
      ],
    );
  }
}