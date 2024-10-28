import 'package:core_munros_data/core_munros_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

part 'munros_state.dart';

@injectable
class MunrosCubit extends Cubit<MunrosState> {
  MunrosCubit(this._munrosService) : super(MunrosLoading());

  final IMunrosService _munrosService;

  Future<void> loadMunros({bool onlyShowClimbed = false}) async {
    await _munrosService
        .getAllMunrosSortedByRegion(onlyShowClimbed: onlyShowClimbed)
        .then((munros) {
      emit(MunrosLoaded(munros));
    });
  }

  Future<void> setMunroToClimbed(
    Munro munro, {
    required DateTime dateClimbed,
    String? notes,
  }) async {
    await _munrosService.setMunroToClimbed(
      munro,
      dateClimbed: dateClimbed,
      notes: notes,
    );

    await loadMunros();
  }
}
