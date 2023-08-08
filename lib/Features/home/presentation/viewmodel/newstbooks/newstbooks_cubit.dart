import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/data/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repos/home_repo_implement.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:equatable/equatable.dart';

part 'newstbooks_state.dart';

class NewstbooksCubit extends Cubit<NewstbooksState> {
  List<BookModel>books=[];

final homerepoimplement homerepo;
  NewstbooksCubit({required this.homerepo}) : super(NewstbooksInitial());
  Fetchnewestbooks()async{
    emit(Newstbooksloading());
var result=await homerepo.fetchnewestbooks();
result.fold((failure) {
  emit(Newstbooksfailure(error: failure.errormessage));
} , (success) {
  books.addAll(success);
 emit(Newstbookssuccess());
});


  }
}
