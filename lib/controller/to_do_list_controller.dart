import 'package:ciolfi_to_do_list/model/task_model.dart';

class ToDoListController {
  String title = '';
  late TaskModel taskModelItem;
  List<TaskModel> myTasks = [];

  void addList({required String title}) {
    taskModelItem = TaskModel(title: title, data: DateTime.now());

    myTasks.add(taskModelItem);
  }

  void clearList() {
    myTasks.clear();
    title = '';
  }
}
