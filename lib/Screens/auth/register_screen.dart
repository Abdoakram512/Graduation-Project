import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grad_project/Screens/auth/login_screen.dart';
import '../../constants/my_methods.dart';
import '../Widgets/social_auth_widget.dart';

class RegisterScreen extends StatefulWidget {
  static String routeName = '/registerScreen';
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> formKey = GlobalKey();
  bool obscureText = true;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _DateOfBirthController = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> _signUpUser(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      try {
        // Attempt to create the user
        await auth.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        // Show success dialog after successful registration
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.topSlide,
          title: 'Registration Successful',
          desc: 'Mail registered successfully.',
          btnOkOnPress: () {
            // Optionally navigate to another screen or perform an action
          },
        ).show();

      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          // Show dialog for weak password
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.topSlide,
            title: 'Weak Password',
            desc: 'The password provided is too weak. Please choose a stronger password.',
            btnOkOnPress: () {},
          ).show();
        } else if (e.code == 'email-already-in-use') {
          // Show dialog for email already in use
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.topSlide,
            title: 'Email Already Registered',
            desc: 'The account already exists for that email.',
            btnOkOnPress: () {},
          ).show();
        } else {
          // Show a generic error dialog
          AwesomeDialog(
            context: context,
            dialogType: DialogType.error,
            animType: AnimType.topSlide,
            title: 'Error',
            desc: e.message ?? 'An unknown error occurred.',
            btnOkOnPress: () {},
          ).show();
        }
      } catch (e) {
        // Handle any other errors
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
      appBar: buildAppBar(context, title: 'New Account'),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildText(
                    title: 'Full Name',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _nameController,
                    decoration: buildInputDecoration(hintText: 'John Doe'),
                  ),
                  const SizedBox(height: 20),
                  buildText(
                    title: 'Email',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _emailController,
                    decoration:
                        buildInputDecoration(hintText: 'example@example.com'),
                  ),
                  const SizedBox(height: 20),
                  buildText(
                    title: 'Password',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: obscureText,
                    decoration: buildInputDecoration(
                      hintText: '*************',
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            obscureText = !obscureText;
                          });
                        },
                        icon: obscurePassword(obscureText),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  buildText(
                    title: 'Mobile Number',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    decoration: buildInputDecoration(hintText: '0123456789'),
                  ),
                  const SizedBox(height: 20),
                  buildText(
                    title: 'Date of Birth',
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  const SizedBox(height: 8),
                  TextFormField(
                      keyboardType: TextInputType.datetime,
                    decoration:
                        buildInputDecoration(hintText: 'DD / MM / YYYY'),
                  ),
                  const SizedBox(height: 40),
                  Center(
                    child: buildText(
                      title: 'By continuing, you agree to ',
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style: GoogleFonts.leagueSpartan(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                        ),
                        children: [
                          TextSpan(
                            text: 'Terms of Use',
                            style: GoogleFonts.leagueSpartan(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF2260FF),
                            ),
                          ),
                          const TextSpan(text: ' and '),
                          TextSpan(
                            text: 'Privacy Policy.',
                            style: GoogleFonts.leagueSpartan(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                              color: const Color(0xFF2260FF),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  buildButton(
                    title: 'Register',
                    onTapped: (){_signUpUser(context);

                      Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                      },

                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: buildText(
                      title: "or sign up with",
                      fontSize: 18,
                      fontWeight: FontWeight.w300,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const SocialAuthWidget(),
                  const SizedBox(height: 40),
                  Center(
                    child: RichText(
                      text: TextSpan(
                        style:
                            const TextStyle(color: Colors.black, fontSize: 16),
                        children: [
                          TextSpan(
                            text: 'Already have an account? ',
                            style: GoogleFonts.leagueSpartan(
                              fontSize: 20,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          TextSpan(
                            text: 'Log in',
                            style: GoogleFonts.leagueSpartan(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                              color: const Color(0xff2260FF),
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(
                                    context, LoginScreen.routeName);
                              },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
