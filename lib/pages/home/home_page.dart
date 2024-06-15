import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:todos_app/pages/add_todo/add_todo_page.dart';
import 'package:todos_app/pages/home/provider/home_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeProvider(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Todo App'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: RefreshIndicator(
              onRefresh: () async {
                context.read<HomeProvider>().getAllTodos();
              },
              child: ListView.builder(
                itemCount: context.watch<HomeProvider>().todos.length,
                itemBuilder: (context, index) {
                  var todo = context.watch<HomeProvider>().todos[index];
                  return TodoTile(
                    index: index,
                    title: "${todo['title']}",
                    description: "${todo['description']}",
                    onDelete: () {
                      context.read<HomeProvider>().removeTodo(index);
                    },
                  );
                },
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            onPressed: () async {
              await Get.to(() => const AddTodoPage());
              context.read<HomeProvider>().getAllTodos();
            },
            child: const Icon(
              Icons.add_rounded,
            ),
          ),
        );
      },
    );
  }
}

class TodoTile extends StatelessWidget {
  final int index;
  final String title;
  final String description;
  final Function onDelete;

  const TodoTile({
    required this.index,
    required this.title,
    required this.description,
    required this.onDelete,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          child: Text("${index + 1}"),
        ),
        title: Text(title),
        subtitle: Text(description),
        trailing: IconButton(
          onPressed: () {
            onDelete();
          },
          icon: const Icon(
            Icons.delete_rounded,
            color: Colors.red,
          ),
        ),
      ),
    ).marginOnly(bottom: 8.0);
  }
}
