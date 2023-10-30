part of 'countr_bloc.dart';

@immutable
abstract class CountrState {}

class CountrInitial extends CountrState {}
class GetInfo extends CountrState {}

class GetInfoProccesState extends CountrState {}

class GetSuccesState extends CountrState {
  final List<dynamic> data;
  GetSuccesState({required this.data});
}

class GetFailureState extends CountrState {}
