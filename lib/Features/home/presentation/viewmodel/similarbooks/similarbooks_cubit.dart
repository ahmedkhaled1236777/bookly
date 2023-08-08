import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/data/book_model/book_model.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:equatable/equatable.dart';

import '../../../data/repos/home_repo_implement.dart';

part 'similarbooks_state.dart';

class SimilarbooksCubit extends Cubit<SimilarbooksState> {
  SimilarbooksCubit(this.homerepo) : super(SimilarbooksInitial());
  List<BookModel>books=[];
  final homerepoimplement homerepo;
  fetchsimilarbooks({required String category})async{
    emit(Similarbooksloading());
var result=await homerepo.fetchsimilarbooks(category: category);
result.fold((failure)  {
emit(Similarbooksfailure(failure.errormessage));
}, (sbuccess) {
  books.addAll(sbuccess);
  emit(Similarbookssucces());
});
  }
}
