import 'package:bookly/Features/home/data/book_model/book_model.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class searchrepo{
 Future< Either<failure,List< BookModel>>>fetchsearchbooks({required String search});
}