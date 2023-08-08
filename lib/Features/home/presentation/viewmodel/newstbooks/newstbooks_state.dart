part of 'newstbooks_cubit.dart';

abstract class NewstbooksState extends Equatable {
  const NewstbooksState();

  @override
  List<Object> get props => [];
}

class NewstbooksInitial extends NewstbooksState {}
class Newstbooksloading extends NewstbooksState {}
class Newstbooksfailure extends NewstbooksState {
  final String error;

  Newstbooksfailure({required this.error});
  
}
class Newstbookssuccess extends NewstbooksState {}
