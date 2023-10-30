import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:wedding_app_flutter/models/wedding.dart';
import '../../server/api_method.dart';

part 'get_with_id_event.dart';
part 'get_with_id_state.dart';

class GetWithIdBloc extends Bloc<GetWithIdEvent, GetWithIdState> {
  GetWithIdBloc() : super(CountrInitial()) {
    on<WeddingIdEvent>(getContr);
  }
  Future getContr(
    WeddingIdEvent event,
    Emitter<GetWithIdState> emit,
  ) async {
    try {
      emit(WeddingProccesState());
      WeddingModel currensy = await ApiMethods().getId(event.id);
      emit(WeddingSuccesState(data: currensy));
      // if (response.statusCode == 200) {
      //   emit(
      //     WeddingSuccesState(data: currensy),
      //   );
      // } else {
      //   emit(WeddingFailureState());
      // }
    } catch (e) {
      print(e);
    }
  }
}
