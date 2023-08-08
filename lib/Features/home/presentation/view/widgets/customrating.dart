import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class customratingl extends StatelessWidget {
   final String rating;
   final String year;

  const customratingl({super.key, required this.rating,required this.year});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          color: Colors.amber,
          size: 12,
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          rating,
          style:
              featurestyles.textstyle14.copyWith(fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 4,
        ),
        Text(
        "($year)",
          style: featurestyles.textstyle14.copyWith(color: Colors.grey),
        )
      ],
    );
  }
}
