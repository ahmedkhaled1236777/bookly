import 'package:bookly/Features/home/data/book_model/book_model.dart';
import 'package:flutter/material.dart';

import 'custombookbutton.dart';

class customactionbuttom extends StatelessWidget {
 final BookModel book;

  const customactionbuttom({super.key, required this.book});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Row(
        children: [
          Expanded(
              child: custombookbutton(
                book: book,
            buttonname: "199 \$",
            buttoncolor: Colors.white,
            textcolor: Colors.black,
            border: BorderRadius.only(
                topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
          )),
          Expanded(
              child: custombookbutton(
                book: book,
            buttonname: "Free preview",
            buttoncolor: Color.fromARGB(255, 204, 124, 124),
            textcolor: Colors.white,
            border: BorderRadius.only(
                topRight: Radius.circular(8), bottomRight: Radius.circular(8)),
          )),
        ],
      ),
    );
  }
}
