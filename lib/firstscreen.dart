import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_application/addtask.dart';
import 'package:todo_application/bloc/cubit/task_cubit.dart';

class Firstscreen extends StatelessWidget {
  const Firstscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of tasks'),
      ),
      body: Column(
        children: [
          BlocBuilder<TaskCubit, TaskState>(builder: (context, state) {
            return ListView.builder(
                shrinkWrap: true,
                itemCount: state.holder.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.holder[index].description.toString()),
                    trailing: Checkbox(
                      tristate: true,
                      value: state.holder[index].status!,
                      onChanged: (bool? value) {
                        BlocProvider.of<TaskCubit>(context)
                            .editingCompletionStatus(index, value);
                      },
                    ),
                  );
                });
          }),
          Center(
            child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Addtask()));
                },
                child: const Text('Press a button to add a task')),
          )
        ],
      ),
    );
  }
}
