import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

/// Builds a button with a specified title and onTapped callback.
Padding buildButton({required Function() onTapped, required String title}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 70), // Horizontal padding
    child: SizedBox(
      height: 70, // Increased height for the button
      width: double.infinity, // Full width of the parent container

      child: ElevatedButton(
        onPressed: onTapped, // Callback when button is pressed
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff2260FF), // Button color
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30), // Rounded corners
          ),
          elevation: 2, // Shadow effect
        ),
        child: Text(
          title, // Button title
          style: GoogleFonts.leagueSpartan(
            color: Colors.white, // Text color
            fontSize: 24, // Text size
            fontWeight: FontWeight.w500, // Text weight
          ),
        ),
      ),
    ),
  );
}

/// Builds a customizable AppBar with a title and a back button.
AppBar buildAppBar(BuildContext context, {required String title}) {
  return AppBar(
    backgroundColor: Colors.transparent, // Transparent background
    elevation: 0, // No shadow
    centerTitle: true, // Center the title
    leading: IconButton(
      iconSize: 30, // Size of the back icon
      color: const Color(0xff2260FF), // Back icon color
      onPressed: () {
        Navigator.pop(context); // Navigate back
      },
      icon: const Icon(Icons.arrow_back_ios_new), // Back icon
    ),
    title: Text(
      title, // AppBar title
      style: GoogleFonts.leagueSpartan(
        fontSize: 30, // Title font size
        fontWeight: FontWeight.w700, // Title font weight
        color: const Color(0xff2260FF), // Title color
      ),
    ),
  );
}

/// Returns an icon representing the visibility of the password.
Widget obscurePassword(bool obscureText) {
  return obscureText
      ? SvgPicture.asset(
          'assets/icons/invisible.svg', // Path to the invisible icon
          width: 30,
          height: 30,
          colorFilter: const ColorFilter.mode(
              Colors.blue, BlendMode.srcIn), // Color filter for icon
        )
      : SvgPicture.asset(
          'assets/icons/visible.svg', // Path to the visible icon
          width: 30,
          height: 30,
          colorFilter: const ColorFilter.mode(
              Colors.blue, BlendMode.srcIn), // Color filter for icon
        );
}

/// Builds a custom input decoration for text fields.
InputDecoration buildInputDecoration({
  required String hintText, // Hint text to display in the input field
  Widget? suffixIcon, // Optional suffix icon
}) {
  return InputDecoration(
    suffixIcon: suffixIcon, // Adds a suffix icon if provided
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16), // Rounded border for errors
      borderSide: const BorderSide(color: Colors.red), // Error border color
    ),
    filled: true, // Fill the input field
    fillColor:
        const Color(0xffECF1FF).withOpacity(0.6), // Fill color with opacity
    hintText: hintText, // Hint text
    hintStyle: GoogleFonts.leagueSpartan(
      fontSize: 18, // Hint text size
      color: const Color(0xff809CFF), // Hint text color
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16), // Rounded border
      borderSide: BorderSide.none, // No border side
    ),
    contentPadding: const EdgeInsets.symmetric(
      vertical: 18, // Vertical padding
      horizontal: 16, // Horizontal padding
    ),
  );
}

/// Builds a social authentication button with a specified asset path.
Widget buildSocialAuthButton(String assetPath, {required Function() onTap}) {
  return CircleAvatar(
    radius: 26, // Radius of the circle
    backgroundColor: const Color(0xffCAD6FF), // Background color of the circle
    child: InkWell(
      onTap: onTap,
      child: SvgPicture.asset(
        assetPath, // Path to the social icon asset
        width: 30, // Icon width
        height: 30, // Icon height
        colorFilter: const ColorFilter.mode(
            Colors.blue, BlendMode.srcIn), // Color filter for the icon
      ),
    ),
  );
}

/// Builds text with customizable properties.
Text buildText({
  required String title, // Text content
  required double fontSize, // Font size
  required FontWeight fontWeight, // Font weight
  Color? color, // Optional color
}) {
  return Text(
    title, // Text content
    style: GoogleFonts.leagueSpartan(
      fontSize: fontSize, // Font size
      fontWeight: fontWeight, // Font weight
      color: color, // Text color
    ),
  );
}
