import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class MyValidators {
  // Show Awesome Dialog
  static void showDialog(BuildContext context, String message) {
    AwesomeDialog(
      context: context,
      dialogType: DialogType.error,
      animType: AnimType.topSlide,
      title: 'Validation Error',
      desc: message,
      btnOkOnPress: () {},
    ).show();
  }

  static String? displayNameValidator(BuildContext context, String? displayName) {
    if (displayName == null || displayName.isEmpty) {
      showDialog(context, 'Display name cannot be empty');
      return 'Display name cannot be empty';
    }
    if (displayName.length < 3 || displayName.length > 20) {
      showDialog(context, 'Display name must be between 3 and 20 characters');
      return 'Display name must be between 3 and 20 characters';
    }
    return null; // Valid
  }

  static String? emailValidator(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      showDialog(context, 'Please enter an email');
      return 'Please enter an email';
    }
    if (!RegExp(r'\b[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Z|a-z]{2,}\b').hasMatch(value)) {
      showDialog(context, 'Please enter a valid email');
      return 'Please enter a valid email';
    }
    return null; // Valid
  }

  static String? validateEmailOrPhone(BuildContext context, String? value) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    final phoneRegex = RegExp(r'^\d{10}$');

    if (value == null || value.isEmpty) {
      showDialog(context, 'Please enter an email or phone number');
      return 'Please enter an email or phone number';
    }
    if (!emailRegex.hasMatch(value) && !phoneRegex.hasMatch(value)) {
      showDialog(context, 'Please enter a valid email or 10-digit phone number');
      return 'Please enter a valid email or 10-digit phone number';
    }
    return null; // Valid
  }

  static String? passwordValidator(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      showDialog(context, 'Please enter a password');
      return 'Please enter a password';
    }
    if (value.length < 6) {
      showDialog(context, 'Password must be at least 6 characters long');
      return 'Password must be at least 6 characters long';
    }
    return null; // Valid
  }

  static String? repeatPasswordValidator(BuildContext context, {String? value, String? password}) {
    if (value != password) {
      showDialog(context, 'Passwords do not match');
      return 'Passwords do not match';
    }
    return null; // Valid
  }

  static String? phoneNumberValidator(BuildContext context, String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      showDialog(context, 'Please enter a phone number');
      return 'Please enter a phone number';
    }
    if (!RegExp(r'^\d{10,15}$').hasMatch(phoneNumber)) {
      showDialog(context, 'Phone number must be 10 to 15 digits');
      return 'Phone number must be 10 to 15 digits';
    }
    return null; // Valid
  }

  static String? dateOfBirthValidator(BuildContext context, String? dob) {
    if (dob == null || dob.isEmpty) {
      showDialog(context, 'Please enter your date of birth');
      return 'Please enter your date of birth';
    }

    final dateRegExp = RegExp(r'^\d{4}-\d{2}-\d{2}$');
    if (!dateRegExp.hasMatch(dob)) {
      showDialog(context, 'Date of birth must be in YYYY-MM-DD format');
      return 'Date of birth must be in YYYY-MM-DD format';
    }

    try {
      DateTime dobDate = DateTime.parse(dob);
      if (dobDate.isAfter(DateTime.now())) {
        showDialog(context, 'Date of birth cannot be in the future');
        return 'Date of birth cannot be in the future';
      }

      int age = DateTime.now().year - dobDate.year;
      if (DateTime.now().isBefore(DateTime(dobDate.year, DateTime.now().month, DateTime.now().day))) {
        age--;
      }
      if (age < 18) {
        showDialog(context, 'You must be at least 18 years old');
        return 'You must be at least 18 years old';
      }
    } catch (e) {
      showDialog(context, 'Invalid date');
      return 'Invalid date';
    }

    return null; // Valid
  }
}
