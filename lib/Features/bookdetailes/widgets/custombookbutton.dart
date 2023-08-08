import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../home/data/book_model/book_model.dart';

class custombookbutton extends StatelessWidget {
  final BorderRadius border;
  final String buttonname;
  final Color buttoncolor;
  final Color textcolor;
final BookModel book;
  const custombookbutton(
      {super.key,
      required this.book,
      required this.border,
      required this.buttonname,
      required this.buttoncolor,
      required this.textcolor});
  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(borderRadius: border)),
            backgroundColor: MaterialStatePropertyAll(buttoncolor)),
        onPressed: () async {
          final Uri _url = Uri.parse(book.volumeInfo!.previewLink!);
           if (!await launchUrl(_url)) {
    throw Exception('Could not launch $_url');

        }},
        child: Text(
          buttonname,
          style: featurestyles.textstyle20
              .copyWith(fontWeight: FontWeight.bold, color: textcolor),
        ));
  }
}
