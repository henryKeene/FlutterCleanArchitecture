import 'package:contact/src/presentation/cubits/cubit/contact_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact'),
        actions: [
          IconButton(
            onPressed: context.read<ContactCubit>().logout,
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text(
              'Contact Page',
            ),
          ),
          ElevatedButton(
            onPressed: context.read<ContactCubit>().navigateToLogging,
            child: const Text('Logging'),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: context.read<ContactCubit>().navigateToThemeShowcase,
            child: const Text('Theme Showcase'),
          ),
        ],
      ),
    );
  }
}
