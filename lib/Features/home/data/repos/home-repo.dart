import 'package:bookly/Features/home/data/book_model/book_model.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class homerepo{
  Future<Either<failure,List<BookModel>>> fetchnewestbooks();
  Future<Either<failure,List<BookModel>>> fetchfeaturedbooks();
  Future<Either<failure,List<BookModel>>> fetchsimilarbooks({required String category});

}