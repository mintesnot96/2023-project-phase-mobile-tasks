import 'dart:io';

class Task {
  String title;
  String description;
  DateTime dueDate;
  bool isCompleted;

  Task(this.title, this.description, this.dueDate, this.isCompleted);

  void toggleStatus() {
    isCompleted = !isCompleted;
  }

  @override
  String toString() {
    return '''
      Title: $title
      Description: $description
      Due Date: ${dueDate.toLocal()}
      Status: ${isCompleted ? 'Completed' : 'Pending'}
    ''';
  }
}

class TaskManager {
  List<Task> tasks = [];

  void addTask(Task task) {
    tasks.add(task);
  }

  void viewAllTasks() {
    if (tasks.isEmpty) {
      print('No tasks found.');
      return;
    }
    for (var i = 0; i < tasks.length; i++) {
      print('Task ${i + 1}:\n${tasks[i]}\n');
    }
  }

  void viewCompletedTasks() {
    final completedTasks = tasks.where((task) => task.isCompleted).toList();
    if (completedTasks.isEmpty) {
      print('No completed tasks found.');
      return;
    }
    for (var i = 0; i < completedTasks.length; i++) {
      print('Completed Task ${i + 1}:\n${completedTasks[i]}\n');
    }
  }

  void viewPendingTasks() {
    final pendingTasks = tasks.where((task) => !task.isCompleted).toList();
    if (pendingTasks.isEmpty) {
      print('No pending tasks found.');
      return;
    }
    for (var i = 0; i < pendingTasks.length; i++) {
      print('Pending Task ${i + 1}:\n${pendingTasks[i]}\n');
    }
  }

  void editTask(int index, String title, String description, DateTime dueDate,
      bool isCompleted) {
    if (index >= 0 && index < tasks.length) {
      tasks[index].title = title;
      tasks[index].description = description;
      tasks[index].dueDate = dueDate;
      tasks[index].isCompleted = isCompleted;
    } else {
      print('Invalid task index.');
    }
  }

  void deleteTask(int index) {
    if (index >= 0 && index < tasks.length) {
      tasks.removeAt(index);
      print('Task deleted.');
    } else {
      print('Invalid task index.');
    }
  }
}

void main() {
  final taskManager = TaskManager();

  while (true) {
    stdout.write(
        '\n\nWould you like to see the task menu? \n\n (1 for yes, 2 for quit): ');
    final showMenuChoice = stdin.readLineSync();

    if (showMenuChoice != '1') {
      print('Task Manager has been terminated.');
      exit(0);
    }
    print('Task Manager Menu:');
    print('1. Add a new task');
    print('2. View all tasks');
    print('3. View completed tasks');
    print('4. View pending tasks');
    print('5. Edit a task');
    print('6. Delete a task');
    print('7. Exit');
    stdout.write('Enter your choice: ');

    final choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        stdout.write('Enter task title: ');
        final title = stdin.readLineSync()!;
        stdout.write('Enter task description: ');
        final description = stdin.readLineSync()!;
        stdout.write('Enter due date (yyyy-MM-dd HH:mm): ');
        final dueDateInput = stdin.readLineSync()!;
        final dueDate = DateTime.parse(dueDateInput);
        taskManager.addTask(Task(title, description, dueDate, false));
        break;
      case '2':
        taskManager.viewAllTasks();
        break;
      case '3':
        taskManager.viewCompletedTasks();
        break;
      case '4':
        taskManager.viewPendingTasks();
        break;
      case '5':
        stdout.write('Enter task index to edit: ');
        final index = int.tryParse(stdin.readLineSync()!) ?? -1;
        if (index >= 0 && index < taskManager.tasks.length) {
          stdout.write('Edit title: ');
          final newTitle = stdin.readLineSync()!;
          stdout.write('Edit description: ');
          final newDescription = stdin.readLineSync()!;
          stdout.write('Edit due date (yyyy-MM-dd HH:mm): ');
          final newDueDateInput = stdin.readLineSync()!;
          final newDueDate = DateTime.parse(newDueDateInput);
          stdout.write('Mark the task completed or not?  (true/false): ');
          final isCompleted = stdin.readLineSync()!.toLowerCase() == 'true';
          taskManager.editTask(
              index, newTitle, newDescription, newDueDate, isCompleted);
        } else {
          print('The task index is Invalid.');
        }
        break;
      case '6':
        stdout.write('Enter task index to delete: ');
        final index = int.tryParse(stdin.readLineSync()!) ?? -1;
        taskManager.deleteTask(index);
        break;
      case '7':
        print('Task Manager has been terminated.');
        exit(0);
        break;
      default:
        print(
            'Try again:\nPlease choose from the given choices (1, 2, 3, 4, 5, 6, 7)');
    }
  }
}
