import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../model/task_model.dart';

class SharedPreferencesRepository {
  SharedPreferencesRepository() {
    SharedPreferences.getInstance().then((value) => sharedPreferences = value);
  }

  late SharedPreferences sharedPreferences;

  void saveTodoList(List<TaskModel> todos) {
    final String saveTodoList = jsonEncode(todos);
    print(saveTodoList);
  }
}
