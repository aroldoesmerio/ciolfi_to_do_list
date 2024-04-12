import 'package:ciolfi_to_do_list/controller/to_do_list_controller.dart';
import 'package:flutter/material.dart';

import '../model/task_model.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  ToDoListController toDoListController = ToDoListController();
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de tarefas'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      controller: textEditingController,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      toDoListController.addList(
                          title: textEditingController.text);

                      setState(() {});
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent,
                        padding: const EdgeInsets.all(14)),
                    child: const Icon(
                      Icons.add,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 2,
                width: MediaQuery.of(context).size.width,
                child: ListView.builder(
                  primary: true,
                  itemCount: toDoListController.myTasks.length,
                  itemBuilder: (BuildContext context, int index) => Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.grey[300],
                      ),
                      child: ListTile(
                        title: Text(
                          '${toDoListController.myTasks[index].data}',
                          style: const TextStyle(fontSize: 12),
                        ),
                        subtitle: Text(toDoListController.myTasks[index].title),
                        trailing: IconButton(
                            onPressed: () {
                              TaskModel deletedItem =
                                  toDoListController.myTasks[index];
                              int deletedItemPosition = toDoListController
                                  .myTasks
                                  .indexOf(toDoListController.myTasks[index]);

                              setState(() {
                                toDoListController.deleteItem(
                                    remove: toDoListController.myTasks[index]);
                              });

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Tarefa ${deletedItem.title} removida com sucesso'),
                                  action: SnackBarAction(
                                      label: 'Desfazer',
                                      onPressed: () {
                                        setState(() {
                                          toDoListController.myTasks.insert(
                                              deletedItemPosition, deletedItem);
                                        });
                                      }),
                                ),
                              );
                            },
                            icon: const Icon(Icons.delete)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                        'Você possui ${toDoListController.myTasks.length} pendencias'),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: ((context) => AlertDialog(
                                title: const Text('Limpar tudo?'),
                                content: const Text(
                                    'Você tem realmente certeza disso?'),
                                actions: [
                                  TextButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(),
                                      child: const Text('Cancelar')),
                                  TextButton(
                                      onPressed: () {
                                        toDoListController.myTasks.clear();
                                        setState(() {
                                          textEditingController.clear();
                                        });
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Confirmar'))
                                ],
                              )),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurpleAccent,
                          padding: const EdgeInsets.all(14)),
                      child: const Text('Limpar tudo')),
                ],
              ),
            ),
          ],
        ));
  }
}
