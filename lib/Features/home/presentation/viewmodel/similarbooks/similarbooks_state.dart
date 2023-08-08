part of 'similarbooks_cubit.dart';

abstract class SimilarbooksState extends Equatable {
  const SimilarbooksState();

  @override
  List<Object> get props => [];
}

class SimilarbooksInitial extends SimilarbooksState {}
class Similarbooksloading extends SimilarbooksState {}
class Similarbookssucces extends SimilarbooksState {}
class Similarbooksfailure extends SimilarbooksState {
  final String error;

  Similarbooksfailure(this.error);
  
}
