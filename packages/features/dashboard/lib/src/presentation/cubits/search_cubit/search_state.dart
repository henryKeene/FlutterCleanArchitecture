part of 'search_cubit.dart';

sealed class SearchState {
  SearchState(this.munros, this.searchTerm);

  final List<Munro> munros;
  final String searchTerm;
}

final class SearchInitial extends SearchState {
  SearchInitial() : super([], '');
}

final class SearchLoaded extends SearchState {
  SearchLoaded(super.munros, super.searchTerm);
}
