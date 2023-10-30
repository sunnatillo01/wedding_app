part of 'get_with_id_bloc.dart';

abstract class GetWithIdEvent {}


class WeddingIdEvent extends GetWithIdEvent {
  final int id;

  WeddingIdEvent(this.id);

}
