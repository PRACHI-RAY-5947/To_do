import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo/utils/routes.dart';

import '../../modals/modals.dart';
import '../../provider/provider.dart';

class TodoListScreen extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text("Create To-do",
        style: GoogleFonts.aBeeZee(
          color: Colors.white,
          fontSize: 30,
          fontWeight: FontWeight.bold,
        ),
      ),
      leading: GestureDetector(onTap: () {
        Navigator.pushReplacementNamed(context, MyRoutes.homePage);
      },
          child: Icon(Icons.arrow_back_outlined,color: Colors.white,)),
      backgroundColor: Colors.brown.shade900
      ),
      backgroundColor: Colors.brown.shade900,
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10),
            child: Align(alignment: Alignment.topLeft,
          ),
          ),
          const SizedBox(
            height: 20
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration:  InputDecoration(
                      hintText: 'Enter to-do item',hintStyle: TextStyle(
                      color: Colors.brown.shade200,
                    )
                    ),
                  ),
                ),
                IconButton(onPressed: (){
                  showDatePicker(context: context, firstDate: DateTime(2024), lastDate: DateTime(2030));

                }, icon: Icon(Icons.calendar_month)),
                IconButton(onPressed: (){
                  showTimePicker(context: context, initialTime: TimeOfDay.now());
                }, icon: Icon(Icons.lock_clock)),
                IconButton.filledTonal(
                  icon: Icon(Icons.add),
                  onPressed: () {
                    if (_textController.text.isNotEmpty) {
                      Provider.of<TodoProvider>(context, listen: false)
                          .addTodo(Todo(title: _textController.text, createdOn:DateTime.now(), dateOn: DateTime.now()));
                      _textController.clear();
                    }
                  },
                ),
                ],
            ),
          ),
          Expanded(
            child: Consumer<TodoProvider>(
              builder: (context, todoProvider, child) {
                return ListView.builder(
                  itemCount: todoProvider.todos.length,
                  itemBuilder: (context, index) {
                    final todo = todoProvider.todos[index];
                    return
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(color: Colors.brown.shade200,
                            borderRadius: BorderRadius.circular(13)),
                            child: ListTile(
                              title:
                              Text(
                                todo.title,
                                style: TextStyle(
                                  decoration: todo.isDone
                                      ? TextDecoration.lineThrough
                                      : TextDecoration.none,
                                ),
                              ),
                              trailing:  IconButton(
                                icon: Icon(
                                  todo.isDone
                                      ? Icons.check_box
                                      : Icons.check_box_outline_blank,
                                ),
                                onPressed: () {
                                  todoProvider.toggleTodoStatus(index);
                                },
                              ),
                                 onLongPress: () {
                                   todoProvider.deleteTodo(index);
                                 },
                            ),
                          ),
                        );
                  },
                );
              },

            ),
          ),
        ],
      ),
    );
  }
}
