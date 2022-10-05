import 'package:dio/dio.dart';
import 'package:zanpakuto/models/user_model.dart';
import 'package:zanpakuto/models/app_response.dart';
import 'package:zanpakuto/repositories/chat/chat_repository.dart';
import 'package:zanpakuto/repositories/repositories.dart';
import 'package:zanpakuto/repositories/users/base_user_repository.dart';
import 'package:zanpakuto/utils/utils.dart';

class UserRepository extends BaseUserRepository {
  final Dio _dioClient;
  UserRepository({
    Dio? dioClient,
  }) : _dioClient = dioClient ?? DioClient().instance;
  @override
  Future<AppResponse<List<UserEntity>>> getUsers() async {
    final response = await _dioClient.get(Endpoints.getUsers);
    return AppResponse<List<UserEntity>>.fromJson(response.data,
        (dynamic json) {
      if (response.data["success"] && json != null) {
        return (json as List).map((e) => UserEntity.fromJson(e)).toList();
      }
      return [];
    });
  }
}
