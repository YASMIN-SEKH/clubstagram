import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';
import 'register.dart';
import 'rsvp.dart';

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

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _homeSectionKey = GlobalKey();
  final GlobalKey _aboutSectionKey = GlobalKey();
  final GlobalKey _upcomingEventsSectionKey = GlobalKey();
  final GlobalKey _pastEventsSectionKey = GlobalKey();

  void scrollToSection(GlobalKey sectionKey) {
    final RenderBox renderBox = sectionKey.currentContext?.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero).dy + _scrollController.offset;

    _scrollController.animateTo(
      position,
      duration: Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Scrollable Content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Welcome Section
                Container(
                  key: _homeSectionKey,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/background.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.0),
                      padding: EdgeInsets.all(24.0),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.7), // White transparent card
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Welcome to Clubstagram',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 64,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Connect. Create. Celebrate – Your Campus Events, Redefined.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                              height: 1.5,
                            ),
                          ),
                          SizedBox(height: 24),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => LoginPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            ),
                            child: Text('LOGIN'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // About Us Section
                Container(
                  key: _aboutSectionKey,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/aboutus.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16.0),
                      padding: EdgeInsets.all(24.0),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7), // Black transparent card
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'About Us',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.robotoMono(
                              fontSize: 84,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 2.0,
                            ),
                          ),
                          SizedBox(height: 24),
                          Text(
                            'Clubstagram is a dynamic platform designed to bring students and campus clubs together.\n'
                                'Whether you want to create events, engage participants, or celebrate achievements,\nClubstagram redefines campus involvement.\n'
                                'Our mission is to foster creativity, collaboration, and a sense of belonging for all students.\n'
                                'Join us in building unforgettable experiences!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Upcoming Events Section
                Container(
                  key: _upcomingEventsSectionKey,
                  color: Color(0xFF020F1F),
                  padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 5),
                      Text(
                        'Upcoming Events',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 260, // Same height as the past events section
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            UpcomingEventCard(
                              imagePath: 'assets/events/techtalk.jpg',
                              eventName: 'Tech Talk 2024',
                              eventDate: 'Dec 20, 2024',
                              link: 'https://example.com/event1',
                            ),
                            UpcomingEventCard(
                              imagePath: 'assets/events/innovationfest.jpeg',
                              eventName: 'Innovation Fest',
                              eventDate: 'Jan 10, 2025',
                              link: 'https://example.com/event2',
                            ),
                            UpcomingEventCard(
                              imagePath: 'assets/events/cultural.jpg',
                              eventName: 'Cultural Night',
                              eventDate: 'Feb 15, 2025',
                              link: 'https://example.com/event3',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Past Events Section
                Container(
                  key: _pastEventsSectionKey,
                  color: Colors.blueGrey,
                  padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Past Events',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 260, // Same height as the upcoming events section
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            PastEventCard(
                              imagePath: 'assets/past/techexpo.jpg',
                              eventName: 'Tech Expo 2023',
                              eventDate: 'Nov 12, 2023',
                              link: 'https://example.com/pastevent1',
                            ),
                            PastEventCard(
                              imagePath: 'assets/past/hack.jpg',
                              eventName: 'CodeFest Finale',
                              eventDate: 'Oct 05, 2023',
                              link: 'https://example.com/pastevent2',
                            ),
                            PastEventCard(
                              imagePath: 'assets/past/art.jpg',
                              eventName: 'Art & Culture Week',
                              eventDate: 'Aug 19, 2023',
                              link: 'https://example.com/pastevent3',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Transparent AppBar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              color: Colors.black.withOpacity(0.4), // Transparent background
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Clubstagram',
                      style: GoogleFonts.playfairDisplay(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Row(
                      children: [
                        TextButton(
                          onPressed: () => scrollToSection(_homeSectionKey),
                          child: Text('Home', style: TextStyle(color: Colors.white)),
                        ),
                        TextButton(
                          onPressed: () => scrollToSection(_aboutSectionKey),
                          child: Text('About', style: TextStyle(color: Colors.white)),
                        ),
                        TextButton(
                          onPressed: () => scrollToSection(_upcomingEventsSectionKey),
                          child: Text('Upcoming Events', style: TextStyle(color: Colors.white)),
                        ),
                        TextButton(
                          onPressed: () => scrollToSection(_pastEventsSectionKey),
                          child: Text('Past Events', style: TextStyle(color: Colors.white)),
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterPage()),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                      ),
                      child: Text('REGISTER →'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HoverableEventCard extends StatefulWidget {
  final String imagePath;
  final String eventName;
  final String eventDate;
  final String link;
  final Color overlayColor;

  HoverableEventCard({
    required this.imagePath,
    required this.eventName,
    required this.eventDate,
    required this.link,
    this.overlayColor = Colors.black54, // Default overlay color
  });

  @override
  _HoverableEventCardState createState() => _HoverableEventCardState();
}

class _HoverableEventCardState extends State<HoverableEventCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => isHovered = true),
      onExit: (_) => setState(() => isHovered = false),
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        width: 200,
        margin: EdgeInsets.only(right: 16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: isHovered ? Colors.white : Colors.black,
              blurRadius: isHovered ? 12.0 : 6.0,
              spreadRadius: isHovered ? 2.0 : 1.0,
            ),
          ],
          image: DecorationImage(
            image: AssetImage(widget.imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: EdgeInsets.all(8.0),
            color: widget.overlayColor,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.eventName,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                Text(
                  widget.eventDate,
                  style: TextStyle(color: Colors.white70, fontSize: 12),
                ),
                SizedBox(height: 8),
                GestureDetector(
                  onTap: () {
                    // Navigate to RSVP Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RSVPPage(eventTitle: widget.eventName),
                      ),
                    );
                  },
                  child: Text(
                    'Learn More →',
                    style: TextStyle(
                      color: Colors.lightBlueAccent,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UpcomingEventCard extends HoverableEventCard {
  UpcomingEventCard({
    required String imagePath,
    required String eventName,
    required String eventDate,
    required String link,
  }) : super(
    imagePath: imagePath,
    eventName: eventName,
    eventDate: eventDate,
    link: link,
    overlayColor: Colors.black54, // Dark overlay for upcoming events
  );
}

class PastEventCard extends HoverableEventCard {
  PastEventCard({
    required String imagePath,
    required String eventName,
    required String eventDate,
    required String link,
  }) : super(
    imagePath: imagePath,
    eventName: eventName,
    eventDate: eventDate,
    link: link,
    overlayColor: Colors.brown.withOpacity(0.8), // Brown overlay for past events
  );
}

class RSVPPage extends StatelessWidget {
  final String eventTitle;

  RSVPPage({required this.eventTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("RSVP for $eventTitle")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("You're about to RSVP for: $eventTitle", style: TextStyle(fontSize: 20)),
            // Add your RSVP form or functionality here
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Confirm RSVP"),
            ),
          ],
        ),
      ),
    );
  }
}
