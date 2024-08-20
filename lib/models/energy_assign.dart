import 'package:equatable/equatable.dart';

class EnergyAssignTask extends Equatable {
  final String name;
  final String description;
  final String assignedEmployee;

  EnergyAssignTask({
    required this.name,
    required this.description,
    required this.assignedEmployee,
  });

  @override
  List<Object?> get props => [name, description, assignedEmployee];
}