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
  final GlobalKey _faqSectionKey = GlobalKey();
  final GlobalKey _contactUsKey = GlobalKey();

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
                            style: GoogleFonts.playfairDisplay(
                              fontSize: 64,
                              fontWeight: FontWeight.bold,
                              color: Colors.yellow[50],
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
                          fontSize: 54,
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
                  color: Color(0xFF020F1F),
                  padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Past Events',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 54,
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

            // FAQ Section
            Container(
              key: _faqSectionKey,
              color: Colors.purple[900],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'FAQs',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 64,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellow[700],
                      ),
                    ),
                    SizedBox(height: 16),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: _faqItems.length,
                      itemBuilder: (context, index) {
                        return FaqCard(
                          item: _faqItems[index],
                          onToggle: () {
                            setState(() {
                              _faqItems[index].isOpen = !_faqItems[index].isOpen;
                            });
                          },
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),

                //contact us section
                // Add this after the FAQ Section
                Container(
                  key: _contactUsKey,
                  color: const Color(0xFF2C2461), // Background color for Contact Us section
                  padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 40.0),
                  child: SingleChildScrollView(
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // "Get in touch" title
                          Text(
                            "Get in touch",
                            style: GoogleFonts.playfairDisplay(
                              color: const Color(0xFFFFA774), // Orange color
                              fontSize: 48,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 30),

                          // Name Field
                          CustomTextField(label: "Name"),
                          const SizedBox(height: 20),

                          // Email Field
                          CustomTextField(label: "Email"),
                          const SizedBox(height: 20),

                          // Message Field
                          CustomTextField(
                            label: "Message",
                            isMultiline: true,
                          ),
                          const SizedBox(height: 40),

                          // Submit Button
                          Center(
                            child: ElevatedButton(
                              onPressed: () {
                                // Add functionality here
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFFFFA774), // Orange color
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 100, vertical: 20),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              child: Text(
                                "Shoooooooot",
                                style: GoogleFonts.roboto(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: const Color(0xFF2C2461), // Text color
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),

                          // Footer Text
                          Center(
                            child: Text(
                              "Your email will not be stored nor spammed, feel free to contact me.",
                              style: GoogleFonts.roboto(
                                color: Colors.grey.shade400,
                                fontSize: 14,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
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
                        DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            dropdownColor: Colors.black,
                            icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                            items: [
                              DropdownMenuItem(
                                value: 'upcoming',
                                child: Text('Upcoming Events', style: TextStyle(color: Colors.white)),
                              ),
                              DropdownMenuItem(
                                value: 'past',
                                child: Text('Past Events', style: TextStyle(color: Colors.white)),
                              ),
                            ],
                            onChanged: (value) {
                              if (value == 'upcoming') {
                                scrollToSection(_upcomingEventsSectionKey);
                              } else if (value == 'past') {
                                scrollToSection(_pastEventsSectionKey);
                              }
                            },
                            hint: Text('Events', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            dropdownColor: Colors.black,
                            icon: Icon(Icons.arrow_drop_down, color: Colors.white),
                            items: [
                              DropdownMenuItem(
                                value: 'sports',
                                child: Text('Sports Club', style: TextStyle(color: Colors.white)),
                              ),
                              DropdownMenuItem(
                                value: 'gaming',
                                child: Text('Gaming Club', style: TextStyle(color: Colors.white)),
                              ),
                              DropdownMenuItem(
                                value: 'coding',
                                child: Text('Coding Club', style: TextStyle(color: Colors.white)),
                              ),
                            ],
                            onChanged: (value) {
                              // Implement club-specific navigation if needed
                            },
                            hint: Text('Clubs', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                        TextButton(
                          onPressed: () => scrollToSection(_faqSectionKey), //
                          child: Text('FAQs', style: TextStyle(color: Colors.white)),
                        ),
                        TextButton(
                          onPressed: () => scrollToSection(_contactUsKey),
                          child: Text('Contact Us', style: TextStyle(color: Colors.white)),
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

final List<Event> events = [
  Event(
    title: 'Web3 Conference',
    description: 'Explore the latest advancements in Web3 technologies and decentralized finance.',
    icon: Icons.language,
  ),
  Event(
    title: 'Gaming Summit',
    description: 'Discover innovations in gaming, NFT integrations, and virtual worlds.',
    icon: Icons.gamepad,
  ),
  Event(
    title: 'Identity Workshop',
    description: 'Learn to build secure digital identities and protect user data.',
    icon: Icons.person_pin,
  ),
];

final List<FaqItem> _faqItems = [
  FaqItem(
    question: 'Who can participate?',
    answer: 'Only the 1st year students of IEM Kolkata (Newtown Campus) under UEM Kolkata can participate.',
  ),
  FaqItem(
    question: 'What is the maximum/minimum team size?',
    answer: 'The maximum team size is 4, and the minimum team size is 2.',
  ),
  FaqItem(
    question: 'What are the domains of HackSnippet 3.0?',
    answer: 'The domains of HackSnippet 3.0 are Web Development, Mobile App Development, and Data Science.',
  ),
  FaqItem(
    question: 'What is the participation fee?',
    answer: 'The participation fee is INR 100 per team.',
  ),
  FaqItem(
    question: 'When and where will the grand finale be held?',
    answer: 'The grand finale will be held on [Date] at [Venue].',
  ),
];



class Event {
  final String title;
  final String description;
  final IconData icon;

  Event({required this.title, required this.description, required this.icon});
}

class EventCard extends StatelessWidget {
  final Event event;

  const EventCard({required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.purple.withOpacity(0.1),
              child: Icon(event.icon, color: Colors.purple, size: 30),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    event.title,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    event.description,
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
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

class FaqItem {
  String question;
  String answer;
  bool isOpen;

  FaqItem({
    required this.question,
    required this.answer,
    this.isOpen = false,
  });
}

class FaqCard extends StatefulWidget {
  final FaqItem item;
  final Function onToggle;

  FaqCard({
    required this.item,
    required this.onToggle,
  });

  @override
  _FaqCardState createState() => _FaqCardState();
}

class _FaqCardState extends State<FaqCard> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: isHovering ? Colors.grey[800] : Colors.black87,
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: InkWell(
        onHover: (hovering) {
          setState(() {
            isHovering = hovering;
          });
        },
        onTap: () => widget.onToggle(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.item.question,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              if (widget.item.isOpen)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    widget.item.answer,
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                ),
            ],
          ),
        ),
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


class CustomTextField extends StatelessWidget {
  final String label;
  final bool isMultiline;

  const CustomTextField({
    required this.label,
    this.isMultiline = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: GoogleFonts.roboto(
            color: Colors.grey.shade400,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: const Color(0xFFFFA774), // Orange underline color
                width: 2,
              ),
            ),
          ),
          child: TextField(
            maxLines: isMultiline ? 5 : 1,
            style: const TextStyle(color: Colors.white),
            cursorColor: const Color(0xFFFFA774),
            decoration: const InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(bottom: 8.0),
            ),
          ),
        ),
      ],
    );
  }
}