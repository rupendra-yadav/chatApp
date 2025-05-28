import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  final String imageUrl;
  final int radius;
  const ProfileImage({super.key, required this.imageUrl, this.radius = 25});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius.toDouble(),
      backgroundImage: NetworkImage(imageUrl),
    );
  }
}
