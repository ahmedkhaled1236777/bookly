import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../home/data/book_model/book_model.dart';
import '../bookdetailes.dart';

class customlistviewitemdetails extends StatelessWidget {
  final String? imageurl;
final BookModel book;
  const customlistviewitemdetails({required this.imageurl,required this.book});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:() =>
          Navigator.of(context).push(MaterialPageRoute(builder: ((context) =>bookdetailes(book:book) ))), 
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: AspectRatio(
          aspectRatio: 2 / 3,
          child:CachedNetworkImage(
            placeholder: (context, url) => Center(child: CircularProgressIndicator(),),
            fit: BoxFit.fill,
            errorWidget: (context, url, error) => Center(child: Text("error"),),
            imageUrl: imageurl==null?"https://assets.goal.com/v3/assets/bltcc7a7ffd2fbf71f5/blt0140200d2e243fae/60dd0aab5543520fcbc72a37/dee970e94399062b52ff4e58bc911bd19e77e206.jpg?auto=webp&format=pjpg&width=3840&quality=60":imageurl!,
         ),
        ),
      ),
    );
  }
}
