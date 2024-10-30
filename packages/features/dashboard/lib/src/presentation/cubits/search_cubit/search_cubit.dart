import 'package:core_munros_data/core_munros_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'search_state.dart';

@injectable
class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this._munrosService) : super(SearchInitial());

  final IMunrosService _munrosService;

  Future<List<Munro>> searchMunros(String searchTerm) async {
    final munros = await _munrosService.searchForMunro(searchTerm);

    return munros;
  }
}
