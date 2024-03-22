import 'package:ciolfi_to_do_list/presentation/to_do_list_page.dart';
import 'package:flutter/material.dart';

import '../controller/home_page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageController homePageController = HomePageController();

  @override
  void initState() {
    homePageController.login = '';
    homePageController.password = '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ValueListenableBuilder<bool>(
                  valueListenable: homePageController.loginError,
                  builder: (BuildContext context, bool loginError, _) {
                    return TextField(
                      decoration: InputDecoration(
                        labelText: 'Login',
                        labelStyle: const TextStyle(fontSize: 20),
                        border: const OutlineInputBorder(),
                        hintText: 'Type here, your Login',
                        errorText:
                            loginError ? 'Erro ao digitar o login' : null,
                      ),
                      onChanged: homePageController.loginOnchanged,
                    );
                  }),
              const SizedBox(
                height: 24,
              ),
              ValueListenableBuilder(
                valueListenable: homePageController.passwordError,
                builder: (BuildContext context, bool passwordError, _) =>
                    TextField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: const TextStyle(fontSize: 20),
                    border: const OutlineInputBorder(),
                    hintText: 'Type here, your password',
                    errorText: passwordError ? 'Erro ao digitar a senha' : null,
                  ),
                  onChanged: homePageController.passwordOnchanged,
                ),
              ),
              const SizedBox(
                height: 37,
              ),
              ValueListenableBuilder(
                  valueListenable: homePageController.enableButton,
                  builder: (BuildContext context, bool enableButton, _) =>
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor:
                              enableButton ? Colors.blue : Colors.blueGrey,
                        ),
                        onPressed: () {
                          if (enableButton) {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => const TodoListPage(),
                              ),
                            );
                          } else {
                            null;
                          }
                        },
                        child: const Text(
                          'Enter',
                          style: TextStyle(color: Colors.white),
                        ),
                      )),
            ],
          )),
    ));
  }
}
