import 'package:core_munros_data/core_munros_data.dart';
import 'package:flutter/material.dart';
import 'package:munro_list/src/presentation/view/widgets/regional_munro_list.dart';

class MunrosListPage extends StatelessWidget {
  const MunrosListPage({required this.munros, required this.region, super.key});

  final String region;

  final List<Munro> munros;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(region),
      ),
      body: RegionalMunroList(
        munros: munros,
      ),
    );
  }
}
