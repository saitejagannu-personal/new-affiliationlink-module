import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class SubscriptionDetailsScreen extends StatelessWidget {
  final String title, description, image;

  const SubscriptionDetailsScreen({super.key, this.title= "", this.description= "", this.image=""});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),
      ),
      body: Column(children: [
        Card(
          child: CachedNetworkImage(imageUrl: image,
          height: 300,
          ),
        ),
        Text(description)
      ],),
    );
  }
}