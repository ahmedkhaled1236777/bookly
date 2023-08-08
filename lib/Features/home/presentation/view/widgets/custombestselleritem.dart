import 'package:bookly/Features/home/data/book_model/book_model.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../bookdetailes/bookdetailes.dart';
import 'customrating.dart';

class custombestselleritem extends StatelessWidget {
final  BookModel book;
  final String imageUrl;
final String book_name;
final String author;
final String price;
final String rating;
final String year;
  const custombestselleritem({super.key,required this.book ,required this.imageUrl, required this.book_name, required this.author, required this.price, required this.rating, required this.year});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
      
        Navigator.of(context).push(MaterialPageRoute(builder: ((context) =>bookdetailes(book: book,) )));
      },child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         SizedBox(
          width: MediaQuery.of(context).size.width*0.2,
        
           child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
             child: AspectRatio(
              aspectRatio: 2/3,
               child: CachedNetworkImage(
                fit: BoxFit.fill,
                imageUrl: imageUrl==null?"":imageUrl,
                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),
                      
               ),
             ),
           ),
         ),
          SizedBox(
            width: 20,
          ),
          Expanded(child: bestsellercolum(imageUrl: imageUrl,price: price,book_name: book_name,rating: "4.2",author: author,year: year,))
        ],
      ),
    );
  }
}

class bestsellercolum extends StatelessWidget {
    final String imageUrl;
    final String rating;
final String book_name;
final String author;
final String price;
final String year;

  const bestsellercolum({super.key, required this.imageUrl, required this.book_name, required this.author, required this.price,  required this.year, required this.rating});
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
        book_name,
          style: featurestyles.textstyle18,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
        SizedBox(
          height: 3,
        ),
        Text(
          author,
          style: featurestyles.textstyle14.copyWith(color: Colors.grey),
        ),
        SizedBox(
          height: 3,
        ),
        customrating(rating: rating,price: price,year: year,)
      ],
    );
  }
}

class customrating extends StatelessWidget {
 final String price;
 final String rating;
 final String year;

  const customrating({super.key, required this.rating, required this.price, required this.year});

  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
         price,
          style:
              featurestyles.textstyle18.copyWith(fontWeight: FontWeight.bold),
        ),
        Spacer(),
        customratingl(rating: rating,year: year,)
      ],
    );
  }
}
