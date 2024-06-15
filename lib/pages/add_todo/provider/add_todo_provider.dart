import 'package:flutter/material.dart';
import 'package:todos_app/services/storage/storage_service.dart';

class AddTodoProvider extends ChangeNotifier{

  var titleController = TextEditingController();
  var descriptionController = TextEditingController();

  AddTodoProvider(){
    addNewTodo();
  }
  void addNewTodo() {
    var title = titleController.text;
    var desc = descriptionController.text;
    if (title.isEmpty || desc.isEmpty) {
      print("Title yoki Description bo'sh!");
      return;
    }
    List todos = StorageService.get("todos") ?? [];
    todos.add({
      "title": title,
      "description": desc,
    });
    StorageService.put("todos", todos);
    titleController.clear();
    descriptionController.clear();
    notifyListeners();
  }
}