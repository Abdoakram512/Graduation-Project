import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';

class FingerPrintAuth extends StatefulWidget {
  const FingerPrintAuth({super.key});

  @override
  State<FingerPrintAuth> createState() => _FingerPrintAuthState();
}

class _FingerPrintAuthState extends State<FingerPrintAuth> {
  late final LocalAuthentication myAuthentication;
  bool authState = false;
  @override
  void initState() {
    // TODO: implement initState
    myAuthentication = LocalAuthentication();
    myAuthentication.isDeviceSupported().then((bool myAuth) => setState(() {
          authState = myAuth;
        }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ElevatedButton(
          onPressed: Authentication, child: const Text('Authnticate ')),
    );
  }

  Future<void> Authentication() async {
    try {
      bool isAuthenticate = await myAuthentication.authenticate(
        localizedReason: "local authentication",
        options: AuthenticationOptions(stickyAuth: true, biometricOnly: true),
      );
      print('Authentication Status is : $isAuthenticate');
    } on PlatformException catch (e) {
      print(e);
    }
    if (!mounted) {
      return;
    }
  }
}
