import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';
import 'register.dart';




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
                // Upcoming Events Section
                // Upcoming Events Section
                Container(
                  key: _upcomingEventsSectionKey,
                  color: Colors.white,
                  padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Section Title
                      Text(
                        'Upcoming Events',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                      ),
                      SizedBox(height: 20),

                      // Responsive Grid Layout for Event Cards
                      LayoutBuilder(
                        builder: (context, constraints) {
                          int crossAxisCount = constraints.maxWidth > 600 ? 3 : 2; // Responsive grid

                          return GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: crossAxisCount,
                              crossAxisSpacing: 16.0,
                              mainAxisSpacing: 16.0,
                              childAspectRatio: 0.85, // Adjusted for description and RSVP button
                            ),
                            itemCount: eventData.length,
                            itemBuilder: (context, index) {
                              final event = eventData[index];
                              return EventCard(
                                imagePath: event['imagePath']!,
                                eventName: event['name']!,
                                eventDate: event['date']!,
                                description: event['description']!,
                              );
                            },
                          );
                        },
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
                          onPressed: () {},
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

  final List<Event> events = [
    Event(
      title: 'Web3 Conference',
      description: 'Explore the latest advancements in Web3 technologies, decentralized finance, and blockchain applications.',
      icon: Icons.language,
    ),
    Event(
      title: 'Gaming Summit',
      description: 'Discover innovations in Web3 gaming, NFT integrations, and blockchain-based virtual worlds.',
      icon: Icons.gamepad,
    ),
    Event(
      title: 'Digital Identity Workshop',
      description: 'Learn how to build secure, decentralized digital identities and protect user data.',
      icon: Icons.person_pin,
    ),
  ];
}

class Event {
  final String title;
  final String description;
  final IconData icon;

  Event({required this.title, required this.description, required this.icon});
}

class EventCard extends StatelessWidget {
  final String imagePath;
  final String eventName;
  final String eventDate;
  final String description;

  EventCard({
    required this.imagePath,
    required this.eventName,
    required this.eventDate,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
            spreadRadius: 1.0,
          ),
        ],
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          // Gradient Overlay for readability
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Colors.black54],
              ),
            ),
          ),
          // Event Details
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12.0),
                  bottomRight: Radius.circular(12.0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    eventName,
                    style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  SizedBox(height: 4),
                  Text(
                    eventDate,
                    style: TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                  SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(color: Colors.white70, fontSize: 10),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      // RSVP Action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
                    ),
                    child: Text('RSVP'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final List<Map<String, String>> eventData = [
  {
    'imagePath': 'assets/events/techtalk.jpg',
    'name': 'Tech Talk 2024',
    'date': 'Dec 20, 2024',
    'description': 'A technology session for future innovators.',
  },
  {
    'imagePath': 'assets/events/innovationfest.jpeg',
    'name': 'Innovation Fest',
    'date': 'Jan 10, 2025',
    'description': 'Showcase your innovative ideas and projects.',
  },
  {
    'imagePath': 'assets/events/cultural.jpg',
    'name': 'Cultural Night',
    'date': 'Feb 15, 2025',
    'description': 'Enjoy performances and cultural programs.',
  },
  {
    'imagePath': 'assets/events/sportsmeet.jpg',
    'name': 'Sports Meet 2025',
    'date': 'Mar 5, 2025',
    'description': 'A sports event to showcase athletic talent.',
  },
];

