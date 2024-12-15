// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
//
// class Event {
//   final String id;
//   final String name;
//   final String date;
//   final String imageUrl;
//
//   Event({required this.id, required this.name, required this.date, required this.imageUrl});
//
//   factory Event.fromJson(Map<String, dynamic> json) {
//     return Event(
//       id: json['id'],
//       name: json['name'],
//       date: json['date'],  // Ensure this is in 'yyyy-MM-ddTHH:mm:ss' format
//       imageUrl: json['imageUrl'],
//     );
//   }
//
//   bool isPastEvent() {
//     final eventDate = DateTime.parse(date);
//     return eventDate.isBefore(DateTime.now());
//   }
// }
//
// class UpcomingEventCard extends StatelessWidget {
//   final String imagePath;
//   final String eventName;
//   final String eventDate;
//   final String link;  // This is the event ID
//
//   UpcomingEventCard({
//     required this.imagePath,
//     required this.eventName,
//     required this.eventDate,
//     required this.link,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     // Parse the event date string into a DateTime object
//     final eventDateTime = DateTime.parse(eventDate);
//     final now = DateTime.now();
//     final isPastEvent = eventDateTime.isBefore(now);
//
//     return Card(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Image.asset(imagePath),
//           Text(eventName),
//           Text('Event Date: ${eventDateTime.toLocal()}'),
//           if (isPastEvent)
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text(
//                 'This event has already passed!',
//                 style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
//               ),
//             )
//           else
//             GestureDetector(
//               onTap: () {
//                 if (!isPastEvent) {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => RsvpPage(eventId: link),
//                     ),
//                   );
//                 }
//               },
//               child: Text(
//                 'Learn More →',
//                 style: TextStyle(
//                   color: Colors.lightBlueAccent,
//                   fontSize: 12,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
//
// class RsvpPage extends StatefulWidget {
//   final String eventId;
//
//   RsvpPage({required this.eventId});
//
//   @override
//   _RsvpPageState createState() => _RsvpPageState();
// }
//
// class _RsvpPageState extends State<RsvpPage> {
//   final _formKey = GlobalKey<FormState>();
//   final TextEditingController _eventIdController = TextEditingController();
//   final TextEditingController _nameController = TextEditingController();
//
//   String? _message;
//   Color? _messageColor;
//
//   Future<void> submitRsvp() async {
//     final eventId = widget.eventId;
//     final name = _nameController.text;
//
//     if (_formKey.currentState!.validate()) {
//       try {
//         final response = await http.post(
//           Uri.parse('http://localhost:5000/rsvp/$eventId'),
//           headers: {'Content-Type': 'application/json'},
//           body: jsonEncode({'name': name}),
//         );
//
//         final responseData = jsonDecode(response.body);
//
//         if (response.statusCode == 200) {
//           setState(() {
//             _message = responseData['message'];
//             _messageColor = Colors.green;
//           });
//         } else {
//           setState(() {
//             _message = responseData['error'];
//             _messageColor = Colors.red;
//           });
//         }
//       } catch (error) {
//         setState(() {
//           _message = 'An error occurred. Please try again.';
//           _messageColor = Colors.red;
//         });
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('RSVP for Event'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [
//               TextFormField(
//                 controller: _eventIdController,
//                 decoration: InputDecoration(labelText: 'Event ID'),
//                 keyboardType: TextInputType.number,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter the event ID';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 16.0),
//               TextFormField(
//                 controller: _nameController,
//                 decoration: InputDecoration(labelText: 'Your Name'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your name';
//                   }
//                   return null;
//                 },
//               ),
//               SizedBox(height: 20.0),
//               ElevatedButton(
//                 onPressed: submitRsvp,
//                 child: Text('Submit RSVP'),
//               ),
//               if (_message != null) ...[
//                 SizedBox(height: 20.0),
//                 Text(
//                   _message!,
//                   style: TextStyle(
//                     color: _messageColor,
//                     fontWeight: FontWeight.bold,
//                   ),
//                   textAlign: TextAlign.center,
//                 ),
//               ],
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RSVPPage(),
    );
  }
}

class RSVPPage extends StatelessWidget {
  final String eventName = 'Tech Talk 2024';
  final String eventDate = 'Dec 20, 2024';
  final String location = 'Tech Auditorium, City Center';
  final String description =
      'Join us for Tech Talk 2024, where industry leaders share insights into the latest technologies and innovations.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Container(
          width: 350,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.purple[50],
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Event Details
              CircleAvatar(
                radius: 30,
                backgroundColor: Colors.amber,
                child: Icon(Icons.event, size: 36, color: Colors.white),
              ),
              SizedBox(height: 16),
              Text(
                eventName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8),
              Text(
                '$eventDate\n$location',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 10),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 20),

              // RSVP Buttons
              Text(
                'Are you attending this event?',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Yes Button
                  RSVPButton(
                    label: 'Yes',
                    color: Colors.green,
                    onPressed: () {
                      // Handle Yes Action
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Thank you for RSVPing "Yes"!')),
                      );
                    },
                  ),
                  SizedBox(width: 16),
                  // No Button
                  RSVPButton(
                    label: 'No',
                    color: Colors.red,
                    onPressed: () {
                      // Handle No Action
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('You have RSVPed "No".')),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RSVPButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onPressed;

  RSVPButton({required this.label, required this.color, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 14,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
