part of 'get_with_id_bloc.dart';

abstract class GetWithIdState {}

class CountrInitial extends GetWithIdState {}
class GetInfo extends GetWithIdState {}

class WeddingProccesState extends GetWithIdState {}

class WeddingSuccesState extends GetWithIdState {
  final WeddingModel data;
  WeddingSuccesState({required this.data});
}

class WeddingFailureState extends GetWithIdState {}
