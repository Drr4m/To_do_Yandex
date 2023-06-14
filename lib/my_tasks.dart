import 'package:flutter/material.dart';
import 'package:todoyandex/core/themes/my_dismissable_widget.dart';
import 'package:todoyandex/my_sliver_bar.dart';
import 'package:todoyandex/task.dart';

import 'add_to_do_screen.dart';

class MyTasks extends StatefulWidget {
  const MyTasks({super.key});

  @override
  State<MyTasks> createState() => _MyTasksState();
}

class _MyTasksState extends State<MyTasks> {
  List<Task> tasks = [];
  int taskIndex = 0;
  bool checked = false;
  bool hide = false;
  void addTodoItem(String task) {
    setState(() {
      tasks.add(Task(task, taskIndex, false));
      taskIndex++;
    });
  }

  void removeTodoItem(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void swipe(
    int index,
    direction,
  ) {
    switch (direction) {
      case DismissDirection.endToStart:
        setState(() {
          tasks.removeAt(index);
        });
        break;
      case DismissDirection.startToEnd:
        setState(() {
          tasks[index].checked = !tasks[index].checked;
        });
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const MySliverBar(),
          Container(
            child: SliverList(
                delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    swipe(index, direction);
                  },
                  background: SwipeActionLeft(),
                  secondaryBackground: SwipeActionRight(),
                  child: CheckboxListTile(
                    activeColor: const Color.fromRGBO(52, 199, 89, 1),
                    value: tasks[index].checked,
                    secondary: const Icon(Icons.info_outline),
                    controlAffinity: ListTileControlAffinity.leading,
                    title: tasks[index].checked == true
                        ? Text(
                            tasks[index].title,
                            style: const TextStyle(
                                decoration: TextDecoration.lineThrough,
                                color: Color.fromRGBO(0, 0, 0, 0.3),
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          )
                        : Text(
                            tasks[index].title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                    onChanged: (value) {
                      setState(
                        () {
                          tasks[index].checked = !tasks[index].checked;
                        },
                      );
                    },
                  ),
                );
              },
              childCount: tasks.length,
            )),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final task = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTodoScreen()),
          );
          if (task != null) {
            addTodoItem(task);
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

Widget SwipeActionLeft() => Container(
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
      color: const Color.fromRGBO(52, 199, 89, 1),
      child: const Icon(
        Icons.check,
        color: Colors.white,
        size: 24,
      ),
    );
Widget SwipeActionRight() => Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.fromLTRB(0, 0, 24, 0),
      color: const Color.fromRGBO(255, 59, 48, 1),
      child: const Icon(
        Icons.delete,
        color: Colors.white,
        size: 24,
      ),
    );
