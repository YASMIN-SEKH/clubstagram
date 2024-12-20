import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login.dart';
import 'register.dart';
import 'rsvp.dart';
import 'profile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/welcome': (context) => WelcomePage(userData: {},),// Define the home route
        '/register': (context) => RegisterPage(),
        // '/profile': (context) => ProfilePage(userData: userData),


      },
    );
  }
}

class WelcomePage extends StatefulWidget {
  final Map<String, dynamic> userData;

  WelcomePage({required this.userData});

  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  late Map<String, dynamic> copiedUserData;
  //copied data from register page

  final ScrollController _scrollController = ScrollController();

  final GlobalKey _homeSectionKey = GlobalKey();
  final GlobalKey _aboutSectionKey = GlobalKey();
  final GlobalKey _upcomingEventsSectionKey = GlobalKey();
  final GlobalKey _pastEventsSectionKey = GlobalKey();
  final GlobalKey _faqSectionKey = GlobalKey();
  final GlobalKey _contactUsKey = GlobalKey();
  final GlobalKey _clubsKey = GlobalKey();

  void scrollToSection(GlobalKey sectionKey) {
    final RenderBox renderBox = sectionKey.currentContext?.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero).dy + _scrollController.offset;

    _scrollController.animateTo(
      position,
      duration: Duration(milliseconds: 800),
      curve: Curves.easeInOut,
    );
  }void initState() {
    super.initState();

    // Copy the passed userData into another variable
    copiedUserData = Map.from(widget.userData);
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
                        //   Text(
                        //     'Welcome to Clubstagram',
                        //     textAlign: TextAlign.center,
                        //     style: GoogleFonts.playfairDisplay(
                        //       fontSize: 64,
                        //       fontWeight: FontWeight.bold,
                        //       color: Colors.black,
                        //     ),
                        //   ),
                        Text('Welcome, ${userData['firstName']}!', style: TextStyle(fontSize: 24)),
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
                              Navigator.pushNamed(context, '/register');
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            ),
                            child: Text('Complete your profile'),
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
                            HoverableEventCard(
                              imagePath: 'assets/past/techexpo.jpg',
                              eventName: 'Tech Expo 2024',
                              eventDate: 'Dec 20, 2024',
                              link: 'https://example.com/event1',
                              isPastEvent: false, // Upcoming event
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
                            UpcomingEventCard(
                              imagePath: 'assets/events/web.png',
                              eventName: 'Web3 Conference',
                              eventDate: 'March 13, 2025',
                              link: 'https://example.com/event3',
                            ),
                            UpcomingEventCard(
                              imagePath: 'assets/events/game.png',
                              eventName: 'Gaming Summit',
                              eventDate: 'April 15, 2025',
                              link: 'https://example.com/event3',
                            ),
                            UpcomingEventCard(
                              imagePath: 'assets/past/hack.jpg',
                              eventName: 'Hack Fest',
                              eventDate: 'April 25, 2025',
                              link: 'https://example.com/event3',
                            ),
                            UpcomingEventCard(
                              imagePath: 'assets/events/identity.jpeg',
                              eventName: 'Identity Workshop',
                              eventDate: 'May 01, 2025',
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
                            HoverableEventCard(
                              imagePath: 'assets/events/techtalk.jpg',
                              eventName: 'Tech Talk 2023',
                              eventDate: 'Dec 20, 2023',
                              link: '',
                              isPastEvent: true, // Past event
                            ),
                            HoverableEventCard(
                              imagePath: 'assets/past/hack.jpg',
                              eventName: 'CodeFest Finale',
                              eventDate: 'Oct 05, 2023',
                              link: '',
                              isPastEvent: true,
                            ),
                            HoverableEventCard(
                              imagePath: 'assets/past/art.jpg',
                              eventName: 'Art & Culture Week',
                              eventDate: 'Aug 19, 2023',
                              link: '',
                              isPastEvent: true,
                            ),
                            HoverableEventCard(
                              imagePath: 'assets/past/web.jpeg',
                              eventName: 'Webinar: Driving business innovation through IT and Cloud cost transformation',
                              eventDate: 'Aug 19, 2023',
                              link: '',
                              isPastEvent: true,
                            ),
                            HoverableEventCard(
                              imagePath: 'assets/past/art.jpeg',
                              eventName: 'Art show',
                              eventDate: 'Aug 19, 2023',
                              link: '',
                              isPastEvent: true,
                            ),
                            HoverableEventCard(
                              imagePath: 'assets/past/concert.jpeg',
                              eventName: 'Musical Night',
                              eventDate: 'Aug 19, 2023',
                              link: '',
                              isPastEvent: true,
                            ),
                            HoverableEventCard(
                              imagePath: 'assets/past/dance.jpg',
                              eventName: 'Dance show',
                              eventDate: 'Aug 19, 2023',
                              link: '',
                              isPastEvent: true,
                            ),
                            HoverableEventCard(
                              imagePath: 'assets/past/art.jpg',
                              eventName: 'Art & Culture Week',
                              eventDate: 'Aug 19, 2023',
                              link: '',
                              isPastEvent: true,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),


                // Clubs Section
                Container(
                  key: _clubsKey,
                  color: Color(0xFF020F1F), // Dark background for the section
                  padding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Clubs',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        height: 220, // Container height for horizontal list
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            HoverableClubCard(
                              imagePath: 'assets/events/sportsmeet.jpg',
                              clubName: 'Sports Club',
                              description: 'Join to explore and play various sports.',
                            ),
                            HoverableClubCard(
                              imagePath: 'assets/clubs/code.jpeg',
                              clubName: 'Coding Club',
                              description: 'A club for coding enthusiasts and developers.',
                            ),
                            HoverableClubCard(
                              imagePath: 'assets/clubs/gaming.png',
                              clubName: 'Gaming Club',
                              description: 'Gamers unite to play and compete.',
                            ),
                            HoverableClubCard(
                              imagePath: 'assets/clubs/dance.jpg',
                              clubName: 'Dance Club',
                              description: 'Express yourself through movement and rhythm.',
                            ),
                            HoverableClubCard(
                              imagePath: 'assets/clubs/music.jpeg',
                              clubName: 'Music Club',
                              description: 'Where music lovers create and perform.',
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
              height: MediaQuery.of(context).size.height,
              color: Colors.purple[900],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 15),
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
                  height: MediaQuery.of(context).size.height,
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
                                Navigator.pushNamed(context, '/contactus');
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
                                "Submit",
                                style: GoogleFonts.roboto(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black, // Text color
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),

                          // Footer Text
                          Center(
                            child: Text(
                              "Your email will not be stored nor spammed, feel free to contact.",
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
                        TextButton(
                          onPressed: () => scrollToSection(_upcomingEventsSectionKey),
                          child: Text('Upcoming Events', style: TextStyle(color: Colors.white)),
                        ),
                        TextButton(
                          onPressed: () => scrollToSection(_pastEventsSectionKey),
                          child: Text('Past Eventss', style: TextStyle(color: Colors.white)),
                        ),
                        TextButton(
                          onPressed: () => scrollToSection(_clubsKey),
                          child: Text('Clubs', style: TextStyle(color: Colors.white)),
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
                          MaterialPageRoute(
                            builder: (context) => ProfilePage(userData: copiedUserData),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                      ),
                      child: Text('PROFILE →'),
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



final List<FaqItem> _faqItems = [
  FaqItem(
    question: 'What is Clubstagram?',
    answer: 'Clubstagram is a platform that connects students to various clubs and events in their institution. Students can explore clubs, join them, RSVP for events, and track their participation in both past and upcoming activities.',
  ),
  FaqItem(
    question: 'Who can use Clubstagram?',
    answer: 'Clubstagram is designed for students and administrators. Students can use it to create profiles, join clubs, and participate in events, while administrators can manage clubs and events.',
  ),
  FaqItem(
    question: 'How can I register on Clubstagram?',
    answer: 'To register, log in with the provided credentials (e.g., Rahul / Rahul@123 for students or admin / admin@123 for administrators). After logging in, students can complete their profile and start engaging with clubs and events.',
  ),
  FaqItem(
    question: 'What features are available for students?',
    answer: 'Students can: View and join clubs of their choice. RSVP for upcoming events. Track their past and upcoming activities. Maintain a personalized profile with all their club memberships and event participations.',
  ),
  FaqItem(
    question: 'What features are available for administrators?',
    answer: 'Administrators can: Create and manage new clubs. Organize and update event details. Oversee user participation in events and club activities',
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
  final bool isPastEvent; // New property to check if the event is past

  HoverableEventCard({
    required this.imagePath,
    required this.eventName,
    required this.eventDate,
    required this.link,
    this.overlayColor = Colors.black54, // Default overlay color
    this.isPastEvent = false, // Default value is false for upcoming events
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
                    if (widget.isPastEvent) {
                      // Show Snackbar for past events
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('This event is completed.'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    } else {
                      // Navigate to the RSVP page for upcoming events
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RSVPPage(
                            eventName: widget.eventName,
                            eventDate: widget.eventDate,
                            imagePath: widget.imagePath,
                          ),
                        ),
                      );
                    }
                  },
                  child: Text(
                    widget.isPastEvent ? 'Event Completed' : 'RSVP →',
                    style: TextStyle(
                      color: widget.isPastEvent ? Colors.grey : Colors.lightBlueAccent,
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

class RSVPPage extends StatelessWidget {
  final String eventName;
  final String eventDate;
  final String imagePath;

  RSVPPage({
    required this.eventName,
    required this.eventDate,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('RSVP for $eventName'),
      //   backgroundColor: Colors.brown,
      // ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(imagePath, height: 200, fit: BoxFit.cover),
              SizedBox(height: 20),
              Text(
                eventName,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                eventDate,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // RSVP Action (e.g., redirect to external link or API call)
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('RSVP Confirmed for $eventName!')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                ),
                child: Text('Confirm RSVP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class ClubCard extends StatefulWidget {
  final String imagePath;
  final String clubName;
  final String description;

  ClubCard({
    required this.imagePath,
    required this.clubName,
    required this.description,
  });

  @override
  _ClubCardState createState() => _ClubCardState();
}

class _ClubCardState extends State<ClubCard> {
  bool isJoined = false; // Tracks whether the user has joined the club

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.only(right: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        image: DecorationImage(
          image: AssetImage(widget.imagePath),
          fit: BoxFit.cover,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6.0,
            spreadRadius: 1.0,
          ),
        ],
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
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
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.clubName,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
              SizedBox(height: 4),
              Text(
                widget.description,
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 12,
                  height: 1.2,
                ),
              ),
              SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  if (!isJoined) {
                    // Navigate to the club details page when joining
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ClubDetailsPage(clubName: widget.clubName),
                      ),
                    );
                  }
                  setState(() {
                    isJoined = !isJoined; // Toggle join/joined status
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isJoined ? Colors.green : Colors.blueAccent,
                ),
                child: Text(
                  isJoined ? 'Joined' : 'Join',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class ClubDetailsPage extends StatelessWidget {
  final String clubName;

  ClubDetailsPage({required this.clubName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('$clubName Details'),
      //   backgroundColor: Colors.white,
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              clubName,
              style: GoogleFonts.playfairDisplay(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Welcome to the $clubName! Explore and enjoy your activities.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}

class HoverableClubCard extends StatefulWidget {
  final String imagePath;
  final String clubName;
  final String description;

  HoverableClubCard({
    required this.imagePath,
    required this.clubName,
    required this.description,
  });

  @override
  _HoverableClubCardState createState() => _HoverableClubCardState();
}

class _HoverableClubCardState extends State<HoverableClubCard> {
  bool isHovered = false;
  bool isJoined = false;

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
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12.0),
                bottomRight: Radius.circular(12.0),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.clubName,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  widget.description,
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 12,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  onPressed: () {
                    // Navigate to Club Details Page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ClubDetailsPage(clubName: widget.clubName),
                      ),
                    );
                    setState(() {
                      isJoined = !isJoined;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                    isJoined ? Colors.green : Colors.blueAccent,
                  ),
                  child: Text(
                    isJoined ? 'Joined' : 'Join',
                    style: TextStyle(color: Colors.white),
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



class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                    Navigator.pushNamed(context, '/login');
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
    );
  }
}

