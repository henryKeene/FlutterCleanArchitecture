import 'package:core_munros_data/core_munros_data.dart';
import 'package:dashboard/src/presentation/cubits/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:starter_app/app/extensions/build_context_extensions.dart';

class MunroSearchBar extends StatelessWidget {
  const MunroSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SearchAnchor(
        isFullScreen: false,
        viewOnChanged: (value) {
          context.read<SearchCubit>().searchMunros(value);
        },
        suggestionsBuilder: (
          BuildContext context,
          SearchController controller,
        ) async {
          final searchTerm = controller.text;

          final munros = await getIt<IMunrosService>().searchForMunro(
            searchTerm,
          );
          return munros
              .map(
                (munro) => ListTile(
                  title: Text(munro.name),
                  onTap: () {
                    controller.closeView(
                      munro.name,
                    );
                  },
                ),
              )
              .toList();
        },
        builder: (context, controller) => SearchBar(
          onTap: () {
            controller.openView();
          },
          controller: controller,
          onChanged: (_) {},
          backgroundColor: WidgetStatePropertyAll(
            context.theme.brightness == Brightness.dark
                ? context.colorScheme.surfaceContainerHighest
                : context.colorScheme.surfaceContainerHigh,
          ),
          leading: const Icon(Icons.search),
          elevation: const WidgetStatePropertyAll(
            0,
          ),
        ),
      ),
    );
  }
}
