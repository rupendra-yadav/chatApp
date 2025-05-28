import 'package:chat_app/utils/colors.dart';
import 'package:flutter/material.dart';

class SenderCard extends StatelessWidget {
  final String message;
  final String time;
  const SenderCard({super.key, required this.message, required this.time});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 300,
        ),
        child: Card(
          color: primaryColor,
          child: Container(
            margin: EdgeInsets.all(20),
            child: Text(message),
          ),
        ),
      ),
    );
  }
}

class ReceiverCard extends StatelessWidget {
  final String message;
  final String time;
  const ReceiverCard({super.key, required this.message, required this.time});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints: BoxConstraints(
          maxWidth: 300,
        ),
        child: Card(
          color: Colors.white,
          child: Container(
            margin: EdgeInsets.all(20),
            child: Text(message),
          ),
        ),
      ),
    );
  }
}
