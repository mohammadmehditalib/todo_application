import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:todo_application/Model/task.dart';
part 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  TaskCubit() : super(TaskState([]));

  void addTask(Task task) {
    state.holder.add(task);
    emit(TaskState(state.holder));
  }

  void editingCompletionStatus(int index, bool? status) {
    state.holder[index].status = !state.holder[index].status!;
    emit(TaskState(state.holder));
  }
}
