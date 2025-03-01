// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sharp_sharp/controllers/auth/auth_controller.dart';
// import 'package:sharp_sharp/domain/models/authentication/login/login_model.dart';
// import 'package:sharp_sharp/infrastructure/utils/app_buttons.dart';
// import 'package:sharp_sharp/presentation/auth/signup_screen.dart';
//
// class LoginScreen extends StatefulWidget {
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }
//
// class _LoginScreenState extends State<LoginScreen> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController passWordController = TextEditingController();
//   final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
//   final AuthController controller = Get.find<AuthController>();
//   bool isLoading = false;
//
//   @override
//   void initState() {
//     super.initState();
//     emailController.text = 'tester@test.com';
//     passWordController.text = 'Password123#';
//   }
//
//   updateLoading(bool value) {
//     setState(() {
//       isLoading = value;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         title: const Text("Login",
//             style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//       ),
//       body: Center(
//         child: SingleChildScrollView(
//           // Enables scrolling to prevent overflow
//           child: Container(
//             padding: const EdgeInsets.all(20),
//             margin: const EdgeInsets.symmetric(horizontal: 15),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(15),
//               boxShadow: const [
//                 BoxShadow(
//                   color: Colors.white,
//                   blurRadius: 5,
//                   spreadRadius: 1,
//                 ),
//               ],
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 const Text("Email"),
//                 TextField(
//                   controller: emailController,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.grey[200],
//                     hintText: "johndoe@gmail.com",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide.none,
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide:
//                           const BorderSide(color: Colors.green, width: 1),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//                 const Text("Password"),
//                 TextField(
//                   controller: passWordController,
//                   obscureText: true,
//                   decoration: InputDecoration(
//                     filled: true,
//                     fillColor: Colors.grey[200],
//                     hintText: "**************",
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide: BorderSide.none,
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                       borderSide:
//                           const BorderSide(color: Colors.green, width: 1),
//                     ),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.centerRight,
//                   child: TextButton(
//                     onPressed: () {},
//                     child: const Text("Forgot your Password?",
//                         style: TextStyle(color: Colors.green)),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 SizedBox(
//                   width: double.infinity,
//                   height: 50,
//                   child: GetBuilder<AuthController>(builder: (controller) {
//                     return AppAuthButton(
//                       isLoading: controller.isLoading,
//                       onPressed: () async {
//                         FocusScope.of(context).unfocus();
//
//                         LoginRequest body = LoginRequest(
//                             login: emailController.text,
//                             password: passWordController.text);
//                         await controller.login(body: body, context: context);
//                       },
//                       buttonText: 'Login',
//                       textColor: Colors.white, // Change text color here
//                     );
//                   }),
//                 ),
//                 const SizedBox(height: 10),
//                 SizedBox(
//                   width: double.infinity,
//                   child: Wrap(
//                     alignment: WrapAlignment.center,
//                     children: [
//                       const Text("Don’t have an account? "),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => SignUpScreen()),
//                           );
//                         },
//                         child: const Text(
//                           "Create an account",
//                           style: TextStyle(color: Colors.green),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//       backgroundColor: Colors.grey[100],
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharp_sharp/controllers/auth/auth_controller.dart';
import 'package:sharp_sharp/domain/models/authentication/login/login_model.dart';
import 'package:sharp_sharp/infrastructure/utils/app_buttons.dart';
import 'package:sharp_sharp/presentation/auth/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final AuthController controller = Get.find<AuthController>();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    emailController.text = 'tester@test.com';
    passWordController.text = 'Password123#';
  }

  updateLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Login",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: const [
                BoxShadow(
                  color: Colors.white,
                  blurRadius: 5,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: Form(
              key: loginKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Email"),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      hintText: "johndoe@gmail.com",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Color(0xFF47862D), width: 1),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email';
                      }
                      final emailRegExp = RegExp(
                          r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$");
                      if (!emailRegExp.hasMatch(value)) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text("Password"),
                  TextFormField(
                    controller: passWordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      hintText: "**************",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Color(0xFF47862D), width: 1),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters long';
                      }
                      return null;
                    },
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: const Text("Forgot your Password?",
                          style: TextStyle(color: Color(0xFF47862D))),
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: GetBuilder<AuthController>(builder: (controller) {
                      return AppAuthButton(
                        isLoading: controller.isLoading,
                        onPressed: () async {
                          FocusScope.of(context).unfocus();
                          if (loginKey.currentState?.validate() ?? false) {
                            LoginRequest body = LoginRequest(
                                login: emailController.text,
                                password: passWordController.text);
                            await controller.login(
                                body: body, context: context);
                          }
                        },
                        buttonText: 'Login',
                        textColor: Colors.white,
                      );
                    }),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      children: [
                        const Text("Don’t have an account? "),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpScreen()),
                            );
                          },
                          child: const Text(
                            "Create an account",
                            style: TextStyle(color: Color(0xFF47862D)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[100],
    );
  }
}
