import 'package:bookly/Features/home/data/book_model/book_model.dart';
import 'package:bookly/Features/home/presentation/viewmodel/featuredbooks/featuredbooks_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'customlistviewitem.dart';

class customlistviewbooks extends StatelessWidget {
            List<BookModel>books=[];

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FeaturedbooksCubit, FeaturedbooksState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        if(state is Featuredbookssuccess){
books.addAll(BlocProvider.of<FeaturedbooksCubit>(context).books)   ;  
   return SizedBox(
          height: MediaQuery.of(context).size.height * 0.3,
          child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => customlistviewitem(imageurl: books[index].volumeInfo?.imageLinks?.thumbnail,book: books[index],),
              separatorBuilder: ((context, index) => SizedBox(
                    width: 8,
                  )),
              itemCount: BlocProvider.of<FeaturedbooksCubit>(context).books.length),
        );}
        else if(state is Featuredbooksfailure){
          return Text(state.error);
        }
        else return Center(child: CircularProgressIndicator(),);
      },
    );
  }
}
