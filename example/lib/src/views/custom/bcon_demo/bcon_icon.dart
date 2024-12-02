import 'package:flutter/material.dart';

class BconIcon extends StatelessWidget {
  final Color color;

  const BconIcon({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    // make color saturated version
    Color saturatedColor = getMostSaturatedVersion(color);

    return Stack(
      alignment: Alignment.center, // Centers the image over the triangle
      children: [
        TriangleShape(color: saturatedColor), // The triangle behind the image
        const Image(
          image: AssetImage('assets/images/BCONSingleIconHollow.png'),
          height: 40,
          width: 40,
        ),
      ],
    );
  }

  Color getMostSaturatedVersion(Color color) {
    // Convert the Color to an HSVColor
    HSVColor hsvColor = HSVColor.fromColor(color);

    // If color is black, white, or gray don't change saturation
    if (hsvColor.saturation != 0.0) {
      hsvColor = hsvColor.withSaturation(1.0);
    }

    // Don't change black
    if (hsvColor.value != 0.0) {
      hsvColor = hsvColor.withValue(1.0);
    }

    // Convert it back to a Color
    return hsvColor.toColor();
  }
}

// Class for color behind BCON icon
class TriangleShape extends StatelessWidget {
  final Color color;

  const TriangleShape({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TriangleClipper(),
      child: Container(
        width: 30, // Adjust width of the triangle
        height: 30, // Adjust height of the triangle
        color: color, // Set the color of the triangle
      ),
    );
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(size.width / 2, 0); // Start at the top center
    path.lineTo(size.width, size.height); // Draw to the bottom right
    path.lineTo(0, size.height); // Draw to the bottom left
    path.close(); // Complete the triangle
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
