import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/data/book_model/book_model.dart';
import 'package:bookly/Features/search/data/repos/search_repo_implementation.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final searchrepoimplementation searchrepo;
  List<BookModel>books=[];
  SearchCubit({required this.searchrepo}) : super(SearchInitial());
  fetchsearchbooks({required String search})async{
   emit(Searchloading());
    var result=await searchrepo.fetchsearchbooks(search: search);
    result.fold((failure){
      emit(Searchfailure(errormessage: failure.errormessage));
    }, (succes) {
      books.addAll(succes);
      emit(Searchsuccess());
    });
  }
}
