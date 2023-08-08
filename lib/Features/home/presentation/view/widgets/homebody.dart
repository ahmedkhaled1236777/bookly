import 'package:bookly/core/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'customappbar.dart';
import 'custombestselleritem.dart';
import 'customlistviewbestseller.dart';
import 'customlistviewbooks.dart';
import 'customlistviewitem.dart';
import 'customtext.dart';

class homebody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16, left: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customappbar(),
            customlistviewbooks(),
            const SizedBox(
              height: 50,
            ),
            customtext(),
            const SizedBox(
              height: 15,
            ),
            customlistviewbestseller()
          ],
        ),
      ),
    );
  }
}
