import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Event {
  final String id;
  final String name;
  final String date;
  final String imageUrl;

  Event({required this.id, required this.name, required this.date, required this.imageUrl});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      id: json['id'],
      name: json['name'],
      date: json['date'],  // Ensure this is in 'yyyy-MM-ddTHH:mm:ss' format
      imageUrl: json['imageUrl'],
    );
  }

  bool isPastEvent() {
    final eventDate = DateTime.parse(date);
    return eventDate.isBefore(DateTime.now());
  }
}

class UpcomingEventCard extends StatelessWidget {
  final String imagePath;
  final String eventName;
  final String eventDate;
  final String link;  // This is the event ID

  UpcomingEventCard({
    required this.imagePath,
    required this.eventName,
    required this.eventDate,
    required this.link,
  });

  @override
  Widget build(BuildContext context) {
    // Parse the event date string into a DateTime object
    final eventDateTime = DateTime.parse(eventDate);
    final now = DateTime.now();
    final isPastEvent = eventDateTime.isBefore(now);

    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imagePath),
          Text(eventName),
          Text('Event Date: ${eventDateTime.toLocal()}'),
          if (isPastEvent)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'This event has already passed!',
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
              ),
            )
          else
            GestureDetector(
              onTap: () {
                if (!isPastEvent) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RsvpPage(eventId: link),
                    ),
                  );
                }
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
    );
  }
}

class RsvpPage extends StatefulWidget {
  final String eventId;

  RsvpPage({required this.eventId});

  @override
  _RsvpPageState createState() => _RsvpPageState();
}

class _RsvpPageState extends State<RsvpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _eventIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  String? _message;
  Color? _messageColor;

  Future<void> submitRsvp() async {
    final eventId = widget.eventId;
    final name = _nameController.text;

    if (_formKey.currentState!.validate()) {
      try {
        final response = await http.post(
          Uri.parse('http://localhost:5000/rsvp/$eventId'),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({'name': name}),
        );

        final responseData = jsonDecode(response.body);

        if (response.statusCode == 200) {
          setState(() {
            _message = responseData['message'];
            _messageColor = Colors.green;
          });
        } else {
          setState(() {
            _message = responseData['error'];
            _messageColor = Colors.red;
          });
        }
      } catch (error) {
        setState(() {
          _message = 'An error occurred. Please try again.';
          _messageColor = Colors.red;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RSVP for Event'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _eventIdController,
                decoration: InputDecoration(labelText: 'Event ID'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the event ID';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Your Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: submitRsvp,
                child: Text('Submit RSVP'),
              ),
              if (_message != null) ...[
                SizedBox(height: 20.0),
                Text(
                  _message!,
                  style: TextStyle(
                    color: _messageColor,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
