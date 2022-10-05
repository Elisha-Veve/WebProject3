import 'package:zanpakuto/models/app_response.dart';
import 'package:zanpakuto/models/requests/requests.dart';
import 'package:zanpakuto/models/user_model.dart';

abstract class BaseAuthRepository {
  Future<AppResponse<AuthUser?>> register(RegisterRequest request);
  Future<AppResponse<AuthUser?>> login(LoginRequest request);
  Future<AppResponse<UserEntity?>> loginWithToken();
  Future<AppResponse> logout();
}
