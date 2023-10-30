import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../server/api_method.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<GetSearchEvent>(getContr);
  }
  Future getContr(
    GetSearchEvent event,
    Emitter<SearchState> emit,
  ) async {
    try {
      emit(GetSearchProccesState());
      List<dynamic> list = await ApiMethods().searchApi(event.text);

      if (list.length != 0) {
        emit(
          GetSearchSuccesState(data: list),
        );
      } else {
        emit(GetSearchFailureState());
      }
    } catch (e) {
      print(e);
    }
  }
}
