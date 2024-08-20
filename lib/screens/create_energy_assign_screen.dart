import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/energy_assign.dart';
import '../models/energy_employe.dart';
import '../view_model/energy_assign_bloc.dart';

class CreateEnergyAssignScreen extends StatelessWidget {
  final List<EnergyEmployee> employees = [
    const EnergyEmployee(id: '1', name: 'Alice'),
    const EnergyEmployee(id: '2', name: 'Bob'),
  ];

  final _formKey = GlobalKey<FormState>();
  final _taskNameController = TextEditingController();
  final _taskDescriptionController = TextEditingController();
  String? _selectedEmployee;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create Task')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _taskNameController,
                decoration: const InputDecoration(labelText: 'Task Name'),
                validator: (value) => value!.isEmpty ? 'Task Name cannot be empty' : null,
              ),
              TextFormField(
                controller: _taskDescriptionController,
                decoration: const InputDecoration(labelText: 'Task Description'),
              ),
              DropdownButtonFormField<String>(
                value: _selectedEmployee,
                items: employees.map((employee) {
                  return DropdownMenuItem(
                    value: employee.id,
                    child: Text(employee.name),
                  );
                }).toList(),
                onChanged: (value) => _selectedEmployee = value,
                decoration: const InputDecoration(labelText: 'Assign to Employee'),
                validator: (value) => value == null ? 'Please select an employee' : null,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final task = EnergyAssignTask(
                      name: _taskNameController.text,
                      description: _taskDescriptionController.text,
                      assignedEmployee: _selectedEmployee!,
                    );
                    context.read<EnergyAssignBloc>().add(AddTaskEvent(task));
                    Navigator.pop(context);
                  }
                },
                child: const Text('Create Task'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
