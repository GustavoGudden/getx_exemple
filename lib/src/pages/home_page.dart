import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_exemple/src/data/models/users.model.dart';
import 'package:getx_exemple/src/data/respositories/git_hub_repositoriy.dart';
import 'package:getx_exemple/src/pages/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController _homeController;

  @override
  void initState() {
    super.initState();
    _homeController =
        HomeController(repositoriy: GitHubRepositoriy(dio: Dio()));
    _homeController.getGitUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Most popular users!!!!'),
      ),
      body: Obx(() {
        final item = _homeController.users;

        return _homeController.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : _homeController.users.isEmpty
                ? const Center(
                    child: Text('nenhum usuario encontrado'),
                  )
                : Padding(
                    padding: const EdgeInsetsDirectional.all(20),
                    child: ListView.builder(
                      itemCount: _homeController.users.length,
                      itemBuilder: (_, index) {
                        return UsersWidget(
                          index: index,
                          users: item,
                        );
                      },
                    ),
                  );
      }),
    );
  }
}

class UsersWidget extends StatelessWidget {
  const UsersWidget({super.key, required this.index, required this.users});

  final List<UsersModel> users;

  final int index;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Row(
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.blue,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    users[index].avatarUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              Text(users[index].login),
              Text(users[index].followers as String),
            ],
          ),
        )
      ],
    );
  }
}
