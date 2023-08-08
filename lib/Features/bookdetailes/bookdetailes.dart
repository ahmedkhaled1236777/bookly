import 'package:bookly/Features/bookdetailes/widgets/custombookdetailappbar.dart';
import 'package:bookly/Features/bookdetailes/widgets/custombookdetailsbody.dart';
import 'package:bookly/Features/home/data/book_model/book_model.dart';
import 'package:bookly/Features/home/presentation/view/widgets/customlistviewitem.dart';
import 'package:bookly/Features/home/presentation/viewmodel/similarbooks/similarbooks_cubit.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/presentation/view/widgets/customrating.dart';

class bookdetailes extends StatefulWidget {
  final BookModel book;
  
  static const String bookdetailesroute = "/bookdetailes";

  const bookdetailes({super.key, required this.book});

  @override
  State<bookdetailes> createState() => _bookdetailesState();
}

class _bookdetailesState extends State<bookdetailes> {
  @override
  void initState() {
    BlocProvider.of<SimilarbooksCubit>(context).fetchsimilarbooks(category: widget.book.volumeInfo!.categories![0]) ; }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: custombookdetailsbody(book: widget.book,));
  }
}
