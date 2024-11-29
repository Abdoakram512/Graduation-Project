import 'package:flutter/material.dart';
import '../constants/my_methods.dart';

class SetPassword extends StatefulWidget {
  static String routeName = '/setPasswordScreen';

  const SetPassword({super.key});

  @override
  State<SetPassword> createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, title: 'Set Password'),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding around the content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align items to the start
          children: [
            buildText(
                title: 'Password ', fontSize: 20, fontWeight: FontWeight.w500),
            const SizedBox(height: 10),
            TextFormField(
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
              obscureText: obscureText, // Make the text field obscure based on the toggle
            ),
            const SizedBox(height: 20), // Increased space for better separation
            buildText(
                title: 'Confirm Password ', fontSize: 20, fontWeight: FontWeight.w500),
            const SizedBox(height: 10),
            TextFormField(
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
              obscureText: obscureText, // Make the text field obscure based on the toggle
            ),
            const SizedBox(height: 30), // Increased space before the button
            buildButton(onTapped: () {}, title: 'Create new password'),
          ],
        ),
      ),
    );
  }
}
