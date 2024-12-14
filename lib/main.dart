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
                          child: Text('REGISTER →'),
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
                          child: Text('LOGIN'),
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
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/aboutus.jpg'), // About Us background image
                  fit: BoxFit.cover,
                ),
              ),
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ABOUT US Title
                  Text(
                    'ABOUT US',
                    style: GoogleFonts.robotoMono(
                      fontSize: 84,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent,
                      letterSpacing: 2.0,
                    ),
                  ),
                  SizedBox(height: 16),
                  // ABOUT US Content
                  Text(
                    'Clubstagram is a dynamic platform designed to bring students and campus clubs together.\nWhether you want to create events, engage participants, or celebrate achievements, Clubstagram redefines campus involvement.\nOur mission is to foster creativity, collaboration, and a sense of belonging for all students.\nJoin us in building unforgettable experiences!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                      height: 1.5,
                    ),
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
