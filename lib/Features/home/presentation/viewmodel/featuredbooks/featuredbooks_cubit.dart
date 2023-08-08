import 'package:bloc/bloc.dart';
import 'package:bookly/Features/home/data/book_model/book_model.dart';
import 'package:bookly/Features/home/data/repos/home_repo_implement.dart';
import 'package:bookly/core/errors/failure.dart';
import 'package:equatable/equatable.dart';

part 'featuredbooks_state.dart';

class FeaturedbooksCubit extends Cubit<FeaturedbooksState> {
   List<BookModel>books=[];
  final homerepoimplement homerepo;
  FeaturedbooksCubit({required this.homerepo}) : super(FeaturedbooksInitial());
  Fetchfeaturedbooks()async{
    emit(Featuredbooksloading());
  var result=await  homerepo.fetchfeaturedbooks();
  result.fold((failure) {
    emit(Featuredbooksfailure(failure.errormessage));
  }, (success) {
books.addAll(success)   ;
print(books);
 emit(Featuredbookssuccess());
  });
  }
}
