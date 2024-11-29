import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  static const String routeName = '/welcomeScreen';

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF0F4FF), // Light background color
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: 16.0), // Side padding for the entire screen
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center the content vertically
            crossAxisAlignment:
                CrossAxisAlignment.center, // Center the content horizontally
            children: [
              Padding(
                padding:
                    const EdgeInsets.only(top: 40), // Top padding for image
                child: Image.asset(
                  'assets/images/facebook.png',
                  width: 220, // Image width
                  height: 280, // Image height
                  fit: BoxFit
                      .cover, // Fit image within the given width and height
                ),
              ),
              const SizedBox(
                  height: 24), // Increased space between image and title
              Text(
                'Welcome to Care Blossom!',
                style: GoogleFonts.leagueSpartan(
                  color: const Color(0xff2260FF),
                  fontSize: 32, // Increased font size for better visibility
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center, // Center the text
              ),
              const SizedBox(height: 16), // Space between title and paragraph
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20), // Padding for paragraph
                child: Text(
                  'Empowering you in the fight against liver cancer with cutting-edge technology. '
                  'Experience early detection and personalized insights. Together, we can conquer liver cancer!',
                  style: GoogleFonts.leagueSpartan(
                    color: const Color(
                        0xff333333), // Darker color for better contrast
                    fontSize: 18, // Increased font size for better readability
                    fontWeight:
                        FontWeight.w400, // Medium font weight for clarity
                    height: 1.6, // Increased line height for better spacing
                  ),
                  textAlign: TextAlign.center, // Center the text
                ),
              ),
              const SizedBox(height: 60), // Increased space before buttons
              SizedBox(
                width: 250, // Slightly wider button
                height: 56, // Increased button height
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff2260FF),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30), // Rounded corners
                    ),
                    elevation: 2, // Added elevation for depth
                  ), // Add your login functionality here
                  child:  Text(
                    "Log In",
                    style: GoogleFonts.leagueSpartan(


                        color: Colors.white, fontSize: 24,fontWeight: FontWeight.normal

                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10), // Space between buttons
              SizedBox(
                width: 250, // Slightly wider button
                height: 56, // Increased button height
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xffCAD6FF),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(30), // Rounded corners
                    ),
                    elevation: 2, // Added elevation for depth
                  ), // Add your sign-up functionality here
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.leagueSpartan(
                        color: const Color(0xff2260FF),
                        fontSize: 24,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
