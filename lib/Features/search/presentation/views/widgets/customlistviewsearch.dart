import 'package:bookly/Features/home/data/book_model/book_model.dart';
import 'package:bookly/Features/search/presentation/views/viewmodel/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../home/presentation/view/widgets/custombestselleritem.dart';

class customlistviewsearch extends StatelessWidget {
  List<BookModel>books=[];
  @override
  Widget build(BuildContext context) {
     books.addAll(BlocProvider.of<SearchCubit>(context).books);
    return ListView.separated(
      
        itemBuilder: ((context, index) {
       print(books[index].volumeInfo!.authors);
   return       custombestselleritem(
book: books[index],imageUrl:  books[index].volumeInfo!.imageLinks?.thumbnail==null?"/bltcc7a7ffd2fbf71f5/blt0140200d2e243fae/60dd0aab5543520fcbc72a37/dee970e94399062b52ff4e58bc911bd19e77e206.jpg?auto=webp&format=pjpg&width=3840&quality=60":books[index].volumeInfo!.imageLinks!.thumbnail!,
          book_name:books[index].volumeInfo!.title!,
          author: books[index].volumeInfo!.authors!.isEmpty?"author": books[index].volumeInfo!.authors![0] ,
          price:"223" ,
          rating: books[index].volumeInfo!.maturityRating!,
          year: books[index].volumeInfo!.publishedDate!

);}),// custombestselleritem(imageUrl: "https://i0.wp.com/www.completesports.com/wp-content/uploads/2018/05/IMG_20180527_063538.jpg?fit=1080%2C1080&ssl=1",)),
        separatorBuilder: ((context, index) => SizedBox(
              height: 5,
            )),
        itemCount:books.length);
  }
}
