import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final double height;
  final double width;
  final String image;

  const ImageContainer({
    super.key,
    required this.height,
    required this.width,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
