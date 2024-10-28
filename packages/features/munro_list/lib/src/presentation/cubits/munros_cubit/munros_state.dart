part of 'munros_cubit.dart';

@immutable
sealed class MunrosState {}

final class MunrosLoading extends MunrosState {}

final class MunrosLoaded extends MunrosState {
  MunrosLoaded(this.munrosByRegion);

  final Map<RegionEnum, List<Munro>> munrosByRegion;
}
