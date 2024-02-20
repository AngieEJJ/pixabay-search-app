import 'package:flutter/material.dart';

class DetailImageScreen extends StatelessWidget {
  const DetailImageScreen({super.key, required this.itemImage, required this.tag});

  final String itemImage;
  final String tag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Center(
          child: Hero(
            tag: tag,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.8,
              child: Image.network(itemImage, fit: BoxFit.contain),
            ),
          ),
        ),
      ),
    );
  }
}
