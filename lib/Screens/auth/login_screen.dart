import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grad_project/Screens/Widgets/social_auth_widget.dart';
import 'package:grad_project/Screens/auth/register_screen.dart';
import 'package:grad_project/Screens/set_password.dart';
import 'package:grad_project/constants/my_validators.dart';

import '../../constants/my_methods.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/loginScreen';
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  bool obscureText = true;
  final GlobalKey<FormState> _formKey = GlobalKey();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> _loginUser(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      try {
        await auth.signInWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        // Navigate to home screen or another screen upon successful login
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.topSlide,
          title: 'Login Successful',
          desc: 'Welcome back!',
          btnOkOnPress: () {
            // Navigate to home or main screen
          },
        ).show();
      } on FirebaseAuthException catch (e) {
        String message;
        if (e.code == 'user-not-found') {
          message = 'No user found for that email.';
        } else if (e.code == 'wrong-password') {
          message = 'Wrong password provided for that user.';
        } else {
          message = e.message ?? 'An unknown error occurred.';
        }
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.topSlide,
          title: 'Error',
          desc: message,
          btnOkOnPress: () {},
        ).show();
      } catch (e) {
        AwesomeDialog(
          context: context,
          dialogType: DialogType.error,
          animType: AnimType.topSlide,
          title: 'Error',
          desc: 'An unexpected error occurred: ${e.toString()}',
          btnOkOnPress: () {},
        ).show();
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'Hello!'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              buildText(
                title: 'Welcome',
                fontSize: 32,
                fontWeight: FontWeight.w700,
                color: const Color(0xff2260FF),
              ),
              const SizedBox(height: 40),
              buildText(
                title: 'Email or Mobile Number',
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.black.withOpacity(0.7),
              ),
              const SizedBox(height: 10),
              TextFormField(
                validator: (value) =>
                    MyValidators.emailValidator(context, value),
                controller: _emailController,
                decoration:
                    buildInputDecoration(hintText: 'example@example.com'),
              ),
              const SizedBox(height: 20),
              buildText(
                title: 'Password',
                fontSize: 20,
                fontWeight: FontWeight.normal,
                color: Colors.black.withOpacity(0.7),
              ),
              const SizedBox(height: 10),
              TextFormField(
                validator: (value) =>
                    MyValidators.passwordValidator(context, value),
                controller: _passwordController,
                obscureText: obscureText,
                decoration: buildInputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(
                          () {
                            obscureText = !obscureText;
                          },
                        );
                      },
                      icon: obscurePassword(obscureText),
                    ),
                    hintText: ' *************'),
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SetPassword.routeName);
                  },
                  child: buildText(
                    title: 'Forgot Password?',
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    color: Colors.blue, // Adjust color if necessary
                  ),
                ),
              ),
              const SizedBox(height: 40),
              buildButton(
                title: 'Log In',
                onTapped: () {
                  _loginUser(context);
                },
              ),
              const SizedBox(height: 20),
              Center(
                child: buildText(
                  title: "or sign up with",
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              const SocialAuthWidget(),
              const SizedBox(height: 30),
              Center(
                child: RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    children: [
                      TextSpan(
                        text: 'Don’t have an account? ',
                        style: GoogleFonts.leagueSpartan(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      TextSpan(
                        text: 'Sign Up',
                        style: GoogleFonts.leagueSpartan(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: const Color(0xff2260FF),
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.pushNamed(
                                context, RegisterScreen.routeName);
                          },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
