import 'package:flutter/material.dart';

void main() {
  runApp(UpcomingEventsApp());
}

class UpcomingEventsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Upcoming Events'),
          backgroundColor: Colors.black,
        ),
        body: EventsScreen(),
      ),
    );
  }
}

class EventsScreen extends StatelessWidget {
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

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Leave your mark',
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'In a world fueled by innovation, every choice matters. Here, you don\'t just adapt; you define. It\'s more than technology — it\'s your legacy.',
            style: TextStyle(fontSize: 16, color: Colors.grey[600]),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: events.length,
              itemBuilder: (context, index) {
                return EventCard(event: events[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

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
                  SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      // Handle "Learn more" button tap
                    },
                    child: Text(
                      'Learn more',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                      ),
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
