import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  final List<double> rating;
  final double size;
  int? ratingCount;
  RatingBar({
    required this.rating,
    this.ratingCount,
    this.size = 18,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> _starList = [];

    double averageRating =
        rating.isNotEmpty ? rating.reduce((a, b) => a + b) / rating.length : 0;
    int realNumber = averageRating.floor();
    int partNumber = ((averageRating - realNumber) * 10).ceil();

    for (int i = 0; i < 5; i++) {
      if (i < realNumber) {
        _starList.add(Icon(
          Icons.star,
          color: Color.fromARGB(255, 250, 225, 0),
        ));
      } else if (i == realNumber && partNumber > 0) {
        _starList.add(Icon(
          Icons.star_half,
          color: Color.fromARGB(255, 250, 225, 0),
        ));
      } else {
        _starList.add(Icon(
          Icons.star,
          color: Colors.grey,
          size: size,
        ));
      }
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: _starList,
    );
  }
}
