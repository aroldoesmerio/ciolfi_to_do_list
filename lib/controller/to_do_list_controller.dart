import 'package:ciolfi_to_do_list/model/task_model.dart';
import 'package:ciolfi_to_do_list/repository/shared_preferences_repository.dart';

class ToDoListController {
  String title = '';
  late TaskModel taskModelItem;
  List<TaskModel> myTasks = [];
  SharedPreferencesRepository sharedPreferencesRepository =
      SharedPreferencesRepository();

  void addList({required String title}) {
    taskModelItem = TaskModel(title: title, data: DateTime.now());

    myTasks.add(taskModelItem);
    sharedPreferencesRepository.saveTodoList(myTasks);
  }

  void deleteItem({required TaskModel remove}) {
    myTasks.remove(remove);
  }

  void clearList() {
    myTasks.clear();
    title = '';
  }
}
