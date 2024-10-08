import 'package:dio/dio.dart';
import 'package:getx_exemple/src/data/models/users.model.dart';

class GitHubRepositoriy {
  final Dio dio;

  GitHubRepositoriy({required this.dio});

  Future<List<UsersModel>> getGitUsers() async {
    final result = await dio.get('https://api.github.com/users');

    final List<UsersModel> users = [];

    if (result.statusCode == 200) {
      result.data.map((item) => users.add(UsersModel.fromMap(item))).toList();
    }
    return users;
  }
}
