import 'package:core_munros_data/core_munros_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lego_architecture_demo_mason/app/extensions/build_context_extensions.dart';
import 'package:munro_list/src/presentation/cubits/munros_cubit/munros_cubit.dart';

class RegionalMunroList extends StatelessWidget {
  const RegionalMunroList({
    required this.munros,
    super.key,
  });

  final List<Munro> munros;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: munros.length,
      itemBuilder: (context, index) {
        final munro = munros[index];
        return MunroListItem(
          munro: munro,
          onClimbedPressed: () => _showClimbedForm(context, munro),
        );
      },
    );
  }

  void _showClimbedForm(BuildContext context, Munro munro) {
    showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return ClimbedForm(
          munro: munro,
          onSubmit: (date, notes) {
            context
                .read<MunrosCubit>()
                .setMunroToClimbed(munro, dateClimbed: date, notes: notes);

            Navigator.pop(context);
          },
        );
      },
    );
  }
}

class MunroListItem extends StatelessWidget {
  const MunroListItem({
    required this.munro,
    required this.onClimbedPressed,
    super.key,
  });

  final Munro munro;
  final VoidCallback onClimbedPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(16),
      title: Text(
        munro.name,
        style: context.textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Text(
            'Height: ${munro.height} ft',
            style: context.textTheme.bodySmall,
          ),
        ],
      ),
      trailing: munro.climbed
          ? null
          : ElevatedButton.icon(
              onPressed: onClimbedPressed,
              label: const Text('Mark as climbed'),
              icon: const Icon(Icons.flag),
            ),
    );
  }
}

class ClimbedForm extends StatefulWidget {
  const ClimbedForm({
    required this.munro,
    required this.onSubmit,
    super.key,
  });

  final Munro munro;
  final void Function(DateTime, String) onSubmit;

  @override
  ClimbedFormState createState() => ClimbedFormState();
}

class ClimbedFormState extends State<ClimbedForm> {
  late DateTime _selectedDate;
  final _notesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Mark ${widget.munro.name} as Climbed',
              style: context.textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            ListTile(
              title: const Text('Date Climbed'),
              subtitle: Text(
                '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
              ),
              trailing: const Icon(Icons.calendar_today),
              onTap: _selectDate,
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _notesController,
              decoration: const InputDecoration(
                labelText: 'Notes',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                widget.onSubmit(_selectedDate, _notesController.text);
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  void dispose() {
    _notesController.dispose();
    super.dispose();
  }
}
