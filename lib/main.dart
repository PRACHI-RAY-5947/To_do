import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/provider.dart';
import 'package:todo/screens/create_Todo/create_Todo.dart';
import 'package:todo/screens/homePage/homePage.dart';
import 'package:todo/screens/splashPage/splashPage.dart';
import 'package:todo/utils/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp(
        title: 'Flutter To-Do App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  HomePage(title: "To-do", date: '', Time: '',),
        routes:{
          // MyRoutes.splashScreen: (context) => SplashScreen(),
          MyRoutes.homePage: (context) =>  HomePage(title: "", date: '', Time: '',),
          MyRoutes.todoScreen: (context) => TodoListScreen(),
        }
       ),
    );
  }
}
