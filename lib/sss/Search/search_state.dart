part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

 class SearchInitial extends SearchState {}

class GetSearch extends SearchState {}

class GetSearchProccesState extends SearchState {}

class GetSearchSuccesState extends SearchState {
  final List<dynamic> data;
  GetSearchSuccesState({required this.data});
}

class GetSearchFailureState extends SearchState {}
