part of 'featuredbooks_cubit.dart';

abstract class FeaturedbooksState extends Equatable {
  const FeaturedbooksState();

  @override
  List<Object> get props => [];
}

class FeaturedbooksInitial extends FeaturedbooksState {}
class Featuredbooksloading extends FeaturedbooksState {}
class Featuredbookssuccess extends FeaturedbooksState {}
class Featuredbooksfailure extends FeaturedbooksState {
  final String error;

  Featuredbooksfailure(this.error);
}
