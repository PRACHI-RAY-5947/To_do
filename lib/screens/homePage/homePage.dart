import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../provider/provider.dart';
import '../../utils/routes.dart';

class HomePage extends StatefulWidget {
   HomePage({super.key, required this.title, required this.date, required this.Time});

  final String date;
  final String Time;
  final String title;
   // final String currentDate = DateFormat('yMMMd').format (DateTime.now());
   // final String currentTime = DateFormat('jm').format (DateTime.now());


   @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade900,
        title: Center(
          child: Text(
            " to-do ",
            style: GoogleFonts.aBeeZee(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body:
      Container(
        height: double.infinity,
        width: double.infinity,
        decoration: (BoxDecoration(
          color: Colors.brown.shade200,
        )
        ),
        child:
        Consumer<TodoProvider>(
          builder: (context, todoProvider, child) {
            return ListView.builder(
              itemCount: todoProvider.todos.length,
              itemBuilder: (context, index) {
                final todo = todoProvider.todos[index];
                return
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.brown.shade50,
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFFF),
        onPressed: (){
          Navigator.pushReplacementNamed(context, MyRoutes.todoScreen);
        },
        child: const Icon(Icons.add,shadows: [BoxShadow(color: Colors.brown)],),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

