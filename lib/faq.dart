import 'package:flutter/material.dart';

class FaqPage extends StatefulWidget {
  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs'),
      ),
      body: ListView.builder(
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

class FaqCard extends StatelessWidget {
  final FaqItem item;
  final Function onToggle;

  FaqCard({
    required this.item,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: InkWell(
        onTap: () => onToggle(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.question,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (item.isOpen)
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    item.answer,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}