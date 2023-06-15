import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoyandex/my_sliver_bar.dart';
import 'package:todoyandex/task.dart';
import 'add_to_do_screen.dart';

final StateProvider hide = StateProvider<bool>((ref) {
  return false;
});

final StateProvider importance = StateProvider<String>((ref) {
  return "Нет";
});

int count = 0;

class MyTasks extends ConsumerStatefulWidget {
  const MyTasks({super.key});

  @override
  ConsumerState<MyTasks> createState() => _MyTasksState();
}

class _MyTasksState extends ConsumerState<MyTasks> {
  List<Task> tasks = [];
  int taskIndex = 0;
  bool checked = false;
  void addTodoItem(String task) {
    setState(() {
      tasks.add(Task(ref.read(importance) + task, taskIndex, false));
      taskIndex++;
    });
  }

  void removeTodoItem(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  bool checkHide(index) {
    return tasks[index].checked == true ? true : false;
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
          tasks[index].checked == true ? count++ : count--;
        });
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final click = ref.watch(hide);
    Widget Dismissibleitem(index) => Dismissible(
          key: UniqueKey(),
          confirmDismiss: (direction) async {
            direction == DismissDirection.startToEnd
                ? swipe(index, direction)
                : false;

            return direction != DismissDirection.endToStart
                ? null
                : showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Confirm"),
                        content: const Text(
                            "Are you sure you wish to delete this item?"),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              swipe(index, direction);
                              Navigator.of(context).pop(true);
                            },
                            child: const Text("DELETE"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                            child: const Text("CANCEL"),
                          ),
                        ],
                      );
                    });
          },
          background: SwipeActionLeft(tasks[index], index),
          secondaryBackground: SwipeActionRight(index),
          child: Container(
            color: Colors.white,
            child: CheckboxListTile(
              activeColor: const Color.fromRGBO(52, 199, 89, 1),
              value: tasks[index].checked,
              secondary: const Icon(Icons.info_outline),
              controlAffinity: ListTileControlAffinity.leading,
              title: Text(
                tasks[index].title,
                style: tasks[index].checked == true
                    ? const TextStyle(
                        decoration: TextDecoration.lineThrough,
                        color: Color.fromRGBO(0, 0, 0, 0.3),
                        fontSize: 16,
                        fontWeight: FontWeight.w400)
                    : const TextStyle(
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
          ),
        );

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          const MySliverBar(),
          SliverToBoxAdapter(
            child: Card(
              margin: const EdgeInsets.all(8),
              elevation: 3,
              shape: const RoundedRectangleBorder(
                  side:
                      BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, 0.1)),
                  borderRadius: BorderRadius.all(Radius.circular(8))),
              child: Column(
                children: [
                  ListView.builder(
                    physics: const ScrollPhysics(),
                    padding: const EdgeInsets.all(0),
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return click == true
                          ? checkHide(index) == false
                              ? Dismissibleitem(index)
                              : SizedBox()
                          : Dismissibleitem(index);
                    },
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(72, 22, 0, 22),
                          child: Text(
                            "Новое",
                            style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 0.3),
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
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

Widget SwipeActionLeft(task, index) => Container(
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
          color: task.checked == true
              ? const Color.fromRGBO(0, 0, 0, 0.3)
              : const Color.fromRGBO(52, 199, 89, 1),
          borderRadius: index == 0
              ? const BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8))
              : null),
      padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
      child: task.checked == true
          ? const Icon(
              Icons.close_rounded,
              color: Colors.white,
              size: 24,
            )
          : const Icon(
              Icons.check,
              color: Colors.white,
              size: 24,
            ),
    );
Widget SwipeActionRight(index) => Container(
      alignment: Alignment.centerRight,
      decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 59, 48, 1),
          borderRadius: index == 0
              ? const BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8))
              : null),
      padding: const EdgeInsets.fromLTRB(0, 0, 24, 0),
      child: const Icon(
        Icons.delete,
        color: Colors.white,
        size: 24,
      ),
    );
