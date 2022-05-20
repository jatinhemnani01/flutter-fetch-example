import 'package:flutter/material.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        children: <Widget>[
          Text(widget.title),
          ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Go Back"))
        ],
      )),
    );
  }
}
