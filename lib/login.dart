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
        extendBodyBehindAppBar: true,
        appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
        'Clubstagram',
        style: GoogleFonts.playfairDisplay(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
    ),
    ),
    centerTitle: false,
    actions: [
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
    ElevatedButton(
    onPressed: () {},
    style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    foregroundColor: Colors.black,
    ),
    child: Text('REGISTER →'),
    ),
    SizedBox(width: 8),
    ],
    ),
    body: SingleChildScrollView(
    child: Column(
    children: [
    // Background Hero Section
    Container(

