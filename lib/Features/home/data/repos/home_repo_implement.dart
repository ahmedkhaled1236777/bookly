import 'package:bookly/Features/home/data/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repos/home-repo.dart';
import 'package:bookly/core/utils/apiservice.dart';
import 'package:dartz/dartz.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/apiservice.dart';

class homerepoimplement implements homerepo{

  @override
  Future<Either<failure, List<BookModel>>> fetchnewestbooks() async{
   try {
  var data=await Apiservice.get(endpoint: "volumes?Filtering=free-ebooks&Sorting=newest &q=subject:magic");
  List<BookModel>books=[];
  for (var element in data["items"]) {
books.add(BookModel.fromJson(element))    ;
    
  }
  print(books);
  return right(books);
}  catch (e) {
  if(e is DioException)
 { return left(serverfailure.fromdioerror(e));}
  else {
    return left(serverfailure(e.toString()));;
  }
}
   
  }

  @override
  Future<Either<failure, List<BookModel>>> fetchfeaturedbooks()async {
   try {
  var data=await Apiservice.get(endpoint: "volumes?Filtering=free-ebooks &q=subject:magic ");
  List<BookModel>books=[];
  for (var element in data["items"]) {
books.add(BookModel.fromJson(element))    ;
  }
print(books);
  return right(books);
}  catch (e) {
  if(e is DioException)
 { return left(serverfailure.fromdioerror(e));}
  else {
    return left(serverfailure(e.toString()));;
  }
}
  }
  
  @override
  Future<Either<failure, List<BookModel>>> fetchsimilarbooks({required String category})async {
     try {
  var data=await Apiservice.get(endpoint: "volumes?Filtering=free-ebooks&Sorting=relevance&q=subject:${category}");
  List<BookModel>books=[];
  for (var element in data["items"]) {
books.add(BookModel.fromJson(element))    ;
    
  }
  print(books.length);
  return right(books);
}  catch (e) {
  if(e is DioException)
 { return left(serverfailure.fromdioerror(e));}
  else {
    return left(serverfailure(e.toString()));;
  }
}
   
  }

}