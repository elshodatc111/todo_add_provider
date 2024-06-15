import 'package:flutter/material.dart';
import 'package:todos_app/services/storage/storage_service.dart';

class HomeProvider extends ChangeNotifier {
  List todos = [];

  HomeProvider() {
    getAllTodos();
  }

  void getAllTodos() {
    todos = StorageService.get("todos")??[];
    notifyListeners();
  }

  void removeTodo(int index) {
    todos = StorageService.get("todos");
    todos.removeAt(index);
    StorageService.put("todos", todos);
    notifyListeners();
  }
}
