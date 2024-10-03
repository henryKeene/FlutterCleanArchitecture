import 'package:contact/src/domain/di/di_initializer.dart';
import 'package:contact/src/presentation/cubits/cubit/contact_cubit.dart';
import 'package:contact/src/presentation/view/pages/contact_page.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ContactFlow extends StatefulWidget {
  const ContactFlow({super.key});

  @override
  State<ContactFlow> createState() => _ContactFlowState();
}

class _ContactFlowState extends State<ContactFlow> {
  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.I<ContactCubit>(),
      child: const ContactPage(),
    );
  }
}
