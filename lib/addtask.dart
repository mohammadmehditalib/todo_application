import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_application/Model/task.dart';
import 'package:todo_application/bloc/cubit/task_cubit.dart';

class Addtask extends StatefulWidget {
  Addtask({super.key});

  @override
  State<Addtask> createState() => _AddtaskState();
}

class _AddtaskState extends State<Addtask> {
  bool isChecked = false;

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a task by entering description and status'),
      ),
      body: Column(
        children: [
          TextField(
            controller: textEditingController,
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              const Text('Completion status'),
              isChecked
                  ? GestureDetector(
                      child: const Icon(Icons.check_box),
                      onTap: () {
                        setState(() {
                          isChecked = !isChecked;
                        });
                      })
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
                      child: const Icon(Icons.check_box_outline_blank))
            ],
          ),
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<TaskCubit>(context)
                    .addTask(Task(isChecked, textEditingController.text));
                Navigator.pop(context);
              },
              child: const Text('Submit'))
        ],
      ),
    );
  }
}
