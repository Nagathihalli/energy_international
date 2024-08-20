import 'package:energy_international/screens/energy_assign_list_screen.dart';
import 'package:energy_international/view_model/energy_assign_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const EnergyAssign());
}

class EnergyAssign extends StatelessWidget {
  const EnergyAssign({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (_) => EnergyAssignBloc(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: EnergyAssignListScreen(),
        ));
  }
}
