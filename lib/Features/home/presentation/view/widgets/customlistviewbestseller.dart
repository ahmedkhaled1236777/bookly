import 'package:bookly/Features/home/data/book_model/book_model.dart';
import 'package:bookly/Features/home/presentation/viewmodel/newstbooks/newstbooks_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custombestselleritem.dart';

class customlistviewbestseller extends StatelessWidget {
  List<BookModel>books=[];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewstbooksCubit, NewstbooksState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        if(state is Newstbookssuccess){
         books.addAll(BlocProvider.of<NewstbooksCubit>(context).books);
         print(books.length);
          return  Padding(
      padding: const EdgeInsets.only(right: 20),
      child: ListView.separated(
          padding: EdgeInsets.all(0),
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: ((context, index) => custombestselleritem(book: books[index],imageUrl: books[index].volumeInfo!.imageLinks!.thumbnail!,
          book_name:books[index].volumeInfo!.title!,
          author: books[index].volumeInfo!.authors![0] ,
          price:"223" ,
          rating: books[index].volumeInfo!.maturityRating!,
          year: books[index].volumeInfo!.publishedDate!,)),
          separatorBuilder: (context, index) => SizedBox(
                height: 5,
              ),
          itemCount: books.length),
    );}
    else if(state is Newstbooksfailure)return
      AlertDialog(
        actions: [
          Text(state.error),
          SizedBox(height: 30,),
          TextButton(onPressed: (() =>Navigator.pop(context) ), child: Text("ok"))
        ],
      );
      else return Center(child: CircularProgressIndicator(),);
    
      },
    );
    
  
  }
}
