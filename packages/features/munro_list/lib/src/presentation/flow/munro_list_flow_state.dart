import 'package:core_munros_data/core_munros_data.dart';

sealed class MunroListFlowState {}

final class ListState extends MunroListFlowState {
  ListState({required this.munros, required this.region});
  String region;
  List<Munro> munros;
}

final class GridState extends MunroListFlowState {}
