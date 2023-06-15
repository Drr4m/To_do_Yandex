import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todoyandex/my_tasks.dart';

class AddTodoScreen extends ConsumerStatefulWidget {
  @override
  ConsumerState<AddTodoScreen> createState() => _AddTodoScreenState();
}

class _AddTodoScreenState extends ConsumerState<AddTodoScreen> {
  final TextEditingController _textEditingController = TextEditingController();

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(child: Text("Нет"), value: "Нет"),
      const DropdownMenuItem(child: Text("Низкая"), value: "Низкая"),
      const DropdownMenuItem(
          child: Text(
            "!! Высокая",
            style: TextStyle(color: Colors.red),
          ),
          value: "Высокая"),
    ];
    return menuItems;
  }

  @override
  Widget build(BuildContext context) {
    var dropdownValue = 'Нет';
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(247, 246, 242, 1),
        leading: Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
          child: IconButton(
            icon: const Icon(
              Icons.close_rounded,
              color: Colors.black,
              size: 24,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 16, 0),
            child: TextButton(
                onPressed: () {
                  ref.read(importance.notifier).update((state) {
                    switch (dropdownValue) {
                      case "Нет":
                        return "Нет";
                      case "Низкая":
                        return "Низкая";
                      case "Высокая":
                        return "Высокая";
                      default:
                        return 'asasa';
                    }
                  });

                  Navigator.pop(context, _textEditingController.text);
                },
                child: const Text('СОХРАНИТЬ',
                    style: TextStyle(
                        color: Color.fromRGBO(0, 122, 255, 1),
                        fontSize: 14,
                        fontWeight: FontWeight.w500))),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints(
                minHeight: 100,
              ),
              child: Card(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: "Что надо сделать...",
                      hintStyle: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.3)),
                      border: InputBorder.none,
                    ),
                    controller: _textEditingController,
                    textInputAction: TextInputAction.newline,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Важность',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: DropdownButtonFormField(
                          icon: Visibility(
                              visible: false,
                              child: Icon(Icons.arrow_downward)),
                          hint: const Text('нет'),
                          decoration: const InputDecoration(
                            labelStyle:
                                TextStyle(color: Color.fromRGBO(0, 0, 0, 0.3)),
                            border: InputBorder.none,
                          ),
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          value: dropdownValue,
                          items: dropdownItems,
                          onChanged: (value) {
                            dropdownValue = value ?? '';
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
