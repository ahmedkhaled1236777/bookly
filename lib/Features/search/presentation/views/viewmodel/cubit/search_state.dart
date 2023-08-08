part of 'search_cubit.dart';

abstract class SearchState extends Equatable {
  const SearchState();

  @override
  List<Object> get props => [];
}

class SearchInitial extends SearchState {}
class Searchloading extends SearchState {}
class Searchsuccess extends SearchState {}
class Searchfailure extends SearchState {
  final String errormessage;

  Searchfailure({required this.errormessage});
  
}
