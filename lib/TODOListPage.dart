import 'package:flutter/material.dart';
import 'package:todo_assignment/TODO.dart';

class TODOListPage extends StatefulWidget {
  const TODOListPage({super.key, required this.title});

  final String title;

  @override
  State<TODOListPage> createState() => _TODOListPageState();
}

class _TODOListPageState extends State<TODOListPage> {

  final TextEditingController _controller = TextEditingController();
  List<TODO> todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: Colors.black26,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              controller: _controller,
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: "Add your item  here",
                hintStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
                onPressed: () {
                  todoList.add(TODO(title: _controller.text));
                  setState(() {
                    _controller.clear();
                  });
                },
                child: const Text('Save')),
          ),
          const SizedBox(height: 10),
          _todoList()
        ],
      ),
    );
  }

  Widget _todoList() {
    return Expanded(
      child: ListView.separated(
          separatorBuilder: (context, index) {
            return const SizedBox(height: 10);
          },
          itemCount: todoList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Container(
              height: 50,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: Row(
                children: [
                  Checkbox(
                      value: todoList[index].isSelcted,
                      onChanged: (value) {
                        setState(() {
                          todoList.elementAt(index).isSelcted = value!;
                        });
                      }),
                  Text(
                    todoList[index].title ?? '',
                    style: TextStyle(
                        color: Colors.black,
                        decoration: todoList[index].isSelcted ? TextDecoration.lineThrough : TextDecoration.none),
                  )
                ],
              ),
            );
          }),
    );
  }
}
