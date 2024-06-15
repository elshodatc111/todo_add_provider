import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:todos_app/pages/add_todo/provider/add_todo_provider.dart';
import 'package:todos_app/services/storage/storage_service.dart';

class AddTodoPage extends StatelessWidget {
  const AddTodoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AddTodoProvider(),
      builder: (context,child){
        return Scaffold(
          appBar: AppBar(
            title: const Text('Add New Todo'),
          ),
          body: Column(
            children: [
              //Todo Title Input
              Container(
                color: Colors.white,
                width: Get.width,
                height: 60,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 4.0,
                ),
                alignment: Alignment.center,
                child: TextFormField(
                  controller: context.watch<AddTodoProvider>().titleController,
                  decoration: InputDecoration(
                    hintText: "Todo Title",
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 12.0),
              //Todo Description Input
              Container(
                color: Colors.white,
                width: Get.width,
                height: 100,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 4.0,
                ),
                alignment: Alignment.center,
                child: TextFormField(
                  controller: context.watch<AddTodoProvider>().descriptionController,
                  maxLines: 3,
                  decoration: InputDecoration(
                    hintText: "Todo Description",
                    hintStyle: TextStyle(
                      color: Colors.grey.shade400,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(Get.width, 50),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                onPressed: () {
                  context.read<AddTodoProvider>().addNewTodo();
                },
                child: const Text(
                  "Add New Todo",
                ),
              ),
            ],
          ).marginAll(16.0),
        );
      },
    );
  }
}
/*

 */
