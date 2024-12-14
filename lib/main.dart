import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Background Hero Section with App Bar
            Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/background.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  // App Bar Navigation
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Clubstagram',
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text('Home', style: TextStyle(color: Colors.white)),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text('About', style: TextStyle(color: Colors.white)),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text('Prizes', style: TextStyle(color: Colors.white)),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text('Timeline', style: TextStyle(color: Colors.white)),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text('FAQs', style: TextStyle(color: Colors.white)),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text('Contacts', style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                          ),
                          child: Text('Register →'),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  // Welcome Text
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Welcome to Clubstagram',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.playfairDisplay(
                            fontSize: 84,
                            fontWeight: FontWeight.bold,
                            color: Colors.brown,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          'Connect. Create. Celebrate – Your Campus Events, Redefined.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            height: 1.5,
                          ),
                        ),
                        SizedBox(height: 24),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          ),
                          child: Text('Apply with Devfolio'),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                ],
              ),
            ),
            // About Us Section
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'About Us',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'Clubstagram is a dynamic platform designed to bring students and campus clubs together. Whether you want to create events, engage participants, or celebrate achievements, Clubstagram redefines campus involvement. Our mission is to foster creativity, collaboration, and a sense of belonging for all students. Join us in building unforgettable experiences!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(height: 24),
                  Image.asset(
                    'assets/about_us_image.png', // Optional image for About Us
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
