import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../models/energy_assign.dart';

// Events
abstract class TaskEvent extends Equatable {
  const TaskEvent();
}

class AddTaskEvent extends TaskEvent {
  final EnergyAssignTask task;

  const AddTaskEvent(this.task);

  @override
  List<Object?> get props => [task];
}

// States
abstract class TaskState extends Equatable {
  const TaskState();
}

class TaskInitial extends TaskState {
  @override
  List<Object?> get props => [];
}

class TaskListState extends TaskState {
  final List<EnergyAssignTask> tasks;

  const TaskListState(this.tasks);

  @override
  List<Object?> get props => [tasks];
}

// BLoC
class EnergyAssignBloc extends Bloc<TaskEvent, TaskState> {
  EnergyAssignBloc() : super(TaskInitial()) {
    on<AddTaskEvent>((event, emit) {
      final List<EnergyAssignTask> updatedTasks = List.from(state is TaskListState ? (state as TaskListState).tasks : [])..add(event.task);
      emit(TaskListState(updatedTasks));
    });
  }
}
