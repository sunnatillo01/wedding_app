import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:meta/meta.dart';

import '../../models/Informations.dart';
import '../../server/api_method.dart';

part 'countr_event.dart';
part 'countr_state.dart';

class CountrBloc extends Bloc<CountrEvent, CountrState> {
  CountrBloc() : super(CountrInitial()) {
    on<GetInfoEvent>(getContr);
  }
  Future getContr(
    GetInfoEvent event,
    Emitter<CountrState> emit,
  ) async {
    try {
      emit(GetInfoProccesState());
      List<dynamic> list = await ApiMethods().getApi();

      if (list.length!=0) {
        emit(
          GetSuccesState(data: list),
        );
      } else {
        emit(GetFailureState());
      }


      
    } catch (e) {
      print(e);
    }
  }
}
