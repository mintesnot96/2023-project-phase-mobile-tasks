import 'package:flutter/material.dart';
import 'onboarding_page.dart';
import 'todo_list_page.dart';
import 'create_task_page.dart';
import 'task_detail_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => OnboardingPage(),
        '/todo': (context) => TodoListPage(),
        '/createTask': (context) => CreateTaskPage(),
        '/taskDetail': (context) => TaskDetailPage(),
      },
    );
  }
}
