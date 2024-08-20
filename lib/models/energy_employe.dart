import 'package:equatable/equatable.dart';

class EnergyEmployee extends Equatable {
  final String id;
  final String name;

  const EnergyEmployee({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}