// import 'package:another_flushbar/flushbar_helper.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sharp_sharp/controllers/auth/auth_controller.dart';
// import 'package:sharp_sharp/domain/models/authentication/register/signup_model.dart';
// import 'package:sharp_sharp/domain/network/exceptions.dart';
// import 'package:sharp_sharp/domain/repository/authentication/auth_repository.dart';
// import 'package:sharp_sharp/presentation/auth/login_screen.dart';
// import 'package:sharp_sharp/presentation/bottom_nav/parcel.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
//
// class SignUpScreen extends StatefulWidget {
//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   final TextEditingController fnameController = TextEditingController();
//   final TextEditingController lnameController = TextEditingController();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passWordController = TextEditingController();
//   final TextEditingController phoneController = TextEditingController();
//   final controller = Get.find<AuthController>();
//   bool isLoading = false;
//   late AuthRepo _authRepo;
//   @override
//   void initState() {
//     super.initState();
//
//     _authRepo = AuthRepo();
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
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//       ),
//       body: Center(
//         child: isLoading
//             ? const SizedBox(
//                 height: 18,
//                 width: 18,
//                 child: CircularProgressIndicator.adaptive())
//             : SingleChildScrollView(
//                 child: Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text("Create an account",
//                           style: TextStyle(
//                               fontSize: 22, fontWeight: FontWeight.bold)),
//                       const SizedBox(height: 5),
//                       const Text(
//                           "Please fill in the fields below to create your account"),
//                       const SizedBox(height: 20),
//                       _buildTextField("First name", "John", fnameController),
//                       const SizedBox(height: 10),
//                       _buildTextField("Last name", "Doe", lnameController),
//                       const SizedBox(height: 10),
//                       _buildTextField(
//                           "Email", "johndoe@gmail.com", emailController),
//                       const SizedBox(height: 10),
//                       _buildPhoneNumberField(controller: phoneController),
//                       const SizedBox(height: 10),
//                       _buildTextField("Password",
//                           "Create your 8-digit password", passWordController,
//                           isPassword: true),
//                       const SizedBox(height: 10),
//                       Row(
//                         children: [
//                           Checkbox(value: true, onChanged: (value) {}),
//                           const Text("Accept Terms & Conditions")
//                         ],
//                       ),
//                       const SizedBox(height: 20),
//                       SizedBox(
//                         width: double.infinity,
//                         height: 50,
//                         child: ElevatedButton(
//                           onPressed: () async {
//                             FocusScope.of(context).unfocus();
//                             isLoading = true;
//                             setState(() {});
//
//                             SignupRequest body = SignupRequest(
//                               fname: fnameController.text,
//                               lname: lnameController.text,
//                               email: emailController.text,
//                               password: passWordController.text,
//                               phone: phoneController.text,
//                               asRider: true,
//                             );
//                             await controller.signUpUser(
//                                 context: context, body: body);
//
//                             isLoading = false;
//                             setState(() {});
//                           },
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: Colors.green,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                           ),
//                           child: const Text("Sign Up",
//                               style:
//                                   TextStyle(fontSize: 16, color: Colors.white)),
//                         ),
//                       ),
//                       const SizedBox(height: 10),
//                       Center(
//                         child: GestureDetector(
//                           onTap: () {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => LoginScreen()),
//                             );
//                           },
//                           child: const Text("You have an account? Login",
//                               style: TextStyle(color: Colors.green)),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//       ),
//       backgroundColor: Colors.grey[100],
//     );
//   }
//
//   Widget _buildTextField(
//       String label, String hint, TextEditingController controller,
//       {bool isPassword = false}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label),
//         const SizedBox(height: 5),
//         TextField(
//           controller: controller,
//           obscureText: isPassword,
//           decoration: InputDecoration(
//             filled: true,
//             fillColor: Colors.grey[200],
//             hintText: hint,
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: BorderSide.none,
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10),
//               borderSide: const BorderSide(color: Colors.green, width: 1),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildPhoneNumberField({required TextEditingController controller}) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text("Phone number"),
//         const SizedBox(height: 5),
//         SizedBox(
//           width: double.infinity,
//           child: IntlPhoneField(
//             controller: controller,
//             decoration: InputDecoration(
//               filled: true,
//               fillColor: Colors.grey[200],
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: BorderSide.none,
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10),
//                 borderSide: const BorderSide(color: Colors.green, width: 1),
//               ),
//             ),
//             disableLengthCheck: true,
//             initialCountryCode: 'NG',
//             onChanged: (phone) {
//               print(phone.completeNumber);
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
import 'package:another_flushbar/flushbar_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharp_sharp/controllers/auth/auth_controller.dart';
import 'package:sharp_sharp/domain/models/authentication/register/signup_model.dart';
import 'package:sharp_sharp/domain/network/exceptions.dart';
import 'package:sharp_sharp/domain/repository/authentication/auth_repository.dart';
import 'package:sharp_sharp/presentation/auth/login_screen.dart';
import 'package:sharp_sharp/presentation/bottom_nav/parcel.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passWordController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final controller = Get.find<AuthController>();
  bool isLoading = false;
  late AuthRepo _authRepo;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _authRepo = AuthRepo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: isLoading
            ? const SizedBox(
                height: 18,
                width: 18,
                child: CircularProgressIndicator.adaptive())
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Create an account",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 5),
                        const Text(
                            "Please fill in the fields below to create your account"),
                        const SizedBox(height: 20),
                        _buildTextField("First name", "John", fnameController,
                            (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        }),
                        const SizedBox(height: 10),
                        _buildTextField("Last name", "Doe", lnameController,
                            (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your last name';
                          }
                          return null;
                        }),
                        const SizedBox(height: 10),
                        _buildTextField(
                            "Email", "johndoe@gmail.com", emailController,
                            (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter an email';
                          }
                          final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+$');
                          if (!emailRegex.hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        }),
                        const SizedBox(height: 10),
                        _buildPhoneNumberField(controller: phoneController),
                        const SizedBox(height: 10),
                        _buildTextField(
                            "Password",
                            "Create your 8-digit password",
                            passWordController, (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          if (value.length < 8) {
                            return 'Password must be at least 8 characters long';
                          }
                          return null;
                        }, isPassword: true),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Checkbox(value: true, onChanged: (value) {}),
                            const Text("Accept Terms & Conditions")
                          ],
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState?.validate() ?? false) {
                                FocusScope.of(context).unfocus();
                                isLoading = true;
                                setState(() {});

                                SignupRequest body = SignupRequest(
                                  fname: fnameController.text,
                                  lname: lnameController.text,
                                  email: emailController.text,
                                  password: passWordController.text,
                                  phone: phoneController.text,
                                  asRider: true,
                                );
                                await controller.signUpUser(
                                    context: context, body: body);

                                isLoading = false;
                                setState(() {});
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color(0xFF47862D),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text("Sign Up",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white)),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()),
                              );
                            },
                            child: const Text("You have an account? Login",
                                style: TextStyle(color: Color(0xFF47862D))),
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

  Widget _buildTextField(String label, String hint,
      TextEditingController controller, String? Function(String?)? validator,
      {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          validator: validator,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            hintText: hint,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFF47862D), width: 1),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneNumberField({required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Phone number"),
        const SizedBox(height: 5),
        SizedBox(
          width: double.infinity,
          child: IntlPhoneField(
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide:
                    const BorderSide(color: Color(0xFF47862D), width: 1),
              ),
            ),
            disableLengthCheck: true,
            initialCountryCode: 'NG',
            onChanged: (phone) {
              print(phone.completeNumber);
            },
          ),
        ),
      ],
    );
  }
}
