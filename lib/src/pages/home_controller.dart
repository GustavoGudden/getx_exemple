import 'package:get/get.dart';
import 'package:getx_exemple/src/data/models/users.model.dart';
import 'package:getx_exemple/src/data/respositories/git_hub_repositoriy.dart';

class HomeController extends GetxController {
  HomeController({required this.repositoriy});
  final GitHubRepositoriy repositoriy;

  //essa variavel esta privada por isso o Rxbool serve para disponibilzar para a view
  final List<UsersModel> _users = <UsersModel>[].obs;
  List<UsersModel> get users => _users;

  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  getGitUsers() async {
    _isLoading.value = true;
    final response = await repositoriy.getGitUsers();
    _users.addAll(response);
    _isLoading.value = false;
  }
}
