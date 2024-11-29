import 'package:flutter/material.dart';

import '../../constants/my_methods.dart';
import '../auth/google_auth.dart';

class SocialAuthWidget extends StatelessWidget {
  const SocialAuthWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        buildSocialAuthButton('assets/icons/facebook.svg', onTap: () {}),
        const SizedBox(width: 20),
        buildSocialAuthButton('assets/icons/finger.svg', onTap: () {}),
        const SizedBox(width: 20),
        buildSocialAuthButton('assets/icons/google.svg', onTap: () {
          signInWithGoogle(context);
        }),
      ],
    );
  }
}
