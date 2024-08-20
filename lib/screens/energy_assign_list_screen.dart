import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../view_model/energy_assign_bloc.dart';
import 'create_energy_assign_screen.dart';

class EnergyAssignListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Task List')),
      body: BlocBuilder<EnergyAssignBloc, TaskState>(
        builder: (context, state) {
          if (state is TaskListState) {
            return ListView.builder(
              itemCount: state.tasks.length,
              itemBuilder: (context, index) {
                final task = state.tasks[index];
                return ListTile(
                  title: Text(task.name),
                  subtitle: Text(
                      '${task.description}\nAssigned to: ${task.assignedEmployee}'),
                );
              },
            );
          } else {
            return Center(child: Text('No tasks available.'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateEnergyAssignScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
