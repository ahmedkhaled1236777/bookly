import 'package:bookly/Features/home/data/book_model/book_model.dart';
import 'package:bookly/Features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dio/dio.dart';

import '../../../../core/utils/apiservice.dart';

class searchrepoimplementation extends searchrepo{

 
 
  @override
  Future<Either<failure,List<BookModel>>> fetchsearchbooks({required String search}) async{
List <BookModel>books=[];
      try{
 var data=await Apiservice.get(endpoint: "volumes?Filtering=free-ebooks &q=subject:${search} ");
   for (var element in data["items"]) {
    books.add(BookModel.fromJson(element));
     
   }
   return right(books);
  }catch(e){
    if(e is DioException)return left(serverfailure.fromdioerror(e));
    else return left(serverfailure(e.toString()));

  }
  }}