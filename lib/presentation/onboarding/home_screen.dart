import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharp_sharp/infrastructure/navigation/routes.dart';
import 'package:sharp_sharp/presentation/auth/signup_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 251, 241, 1),
      body: SafeArea(
        child: Stack(
          children: [
            // Text & Buttons Section (Moved Down)
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: screenHeight * 0.5,
                width: screenWidth,
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 50), // Increased bottom padding
                decoration: const BoxDecoration(
                  color: Color(0xFF274A19),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40), // Moves text further down
                      const Text(
                        "Welcome to \nGoSharpSharp Logistics",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(255, 199, 0, 1),
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Get started to start sending orders",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color.fromRGBO(255, 225, 225, 1),
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 32),
                      AppAuthButton(
                        buttonText: 'Login',
                        onPressed: () {
                          Get.toNamed(AppRoutes.LOGIN);
                        },
                        textColor: const Color(0xFF47862D),
                        style: ButtonStyle(
                          backgroundColor: const WidgetStatePropertyAll(
                            Color.fromRGBO(255, 225, 225, 1),
                          ),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      AppAuthButton(
                        buttonText: 'Sign up',
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ),
                          );
                        },
                        textColor: Colors.white,
                        style: ButtonStyle(
                          backgroundColor: const WidgetStatePropertyAll(
                            Color(0xFF47862D),
                          ),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Image Section (No Changes)
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: screenHeight * 0.5,
                  width: screenWidth - 60,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(24),
                    child: Image.asset(
                      'assets/images/home.png',
                      fit: BoxFit.cover,
                    ),
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

class AppAuthButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String buttonText;
  final Color? textColor;
  final bool isLoading;
  final ButtonStyle? style;

  const AppAuthButton({
    super.key,
    required this.buttonText,
    this.onPressed,
    this.textColor,
    this.isLoading = false,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: style,
        child: isLoading
            ? const CircularProgressIndicator.adaptive(strokeWidth: 2)
            : Text(
                buttonText,
                style: TextStyle(
                  fontSize: 14,
                  color: textColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
