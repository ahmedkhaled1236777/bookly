import 'package:bookly/Features/home/data/book_model/book_model.dart';
import 'package:bookly/Features/home/presentation/viewmodel/similarbooks/similarbooks_cubit.dart';
import 'package:flutter/material.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../home/presentation/view/widgets/customlistviewitem.dart';
import '../../home/presentation/view/widgets/customrating.dart';
import 'customactionbutton.dart';
import 'custombookbutton.dart';
import 'custombookdetailappbar.dart';
import 'customlistviewdetails.dart';

class custombookdetailsbody extends StatelessWidget {
  final BookModel book;
List<BookModel>books=[];
   custombookdetailsbody({super.key, required this.book});
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return SafeArea(
        child: CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  custombookdetailsappbar(),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.15),
                    child: customlistviewitem(
                      book: book,
                      imageurl: book.volumeInfo!.imageLinks!.thumbnail,
                    ),
                  ),
                  SizedBox(
                    height: 43,
                  ),
                  Text(
                    book.volumeInfo!.title!,
                    style: featurestyles.textstyle30,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Opacity(
                      opacity: 0.7,
                      child: Text(
                        book.volumeInfo!.authors![0],
                        style: featurestyles.textstyle16,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  customratingl(
                    rating: "4.2",
                    year: "102",
                  ),
                  Expanded(
                      child: SizedBox(
                    height: 30,
                  )),
                  customactionbuttom(book: book,),
                  SizedBox(
                    height: 30,
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "You can also like",
                        style: featurestyles.textstyle20,
                        textAlign: TextAlign.left,
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                      height: 100,
                      child: BlocBuilder<SimilarbooksCubit, SimilarbooksState>(
                        builder: (context, state) {
                          if(state is Similarbookssucces){

                            books.addAll(BlocProvider.of<SimilarbooksCubit>(context).books);
                          return ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(
                              width: 5,
                            ),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: ((context, index) =>
                                customlistviewitemdetails(
                                  imageurl:
                                      books[index].volumeInfo?.imageLinks?.thumbnail??null,
                                  book: book,
                                )),
                            itemCount: BlocProvider.of<SimilarbooksCubit>(context).books.length,
                          );}
                          else if(state is Similarbooksfailure) return Text(state.error);
                          else return Center(child: CircularProgressIndicator(),);
                        },
                      )),
                  SizedBox(
                    height: 20,
                  )
                ],
              )),
        )
      ],
    ));
  }
}
