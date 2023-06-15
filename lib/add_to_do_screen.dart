import 'package:flutter/material.dart';

class AddTodoScreen extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            Card(
              color: Colors.white,
              child: SizedBox(
                height: 100,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: TextField(
                    decoration: InputDecoration(
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
          ],
        ),
      ),
    );
  }
}
