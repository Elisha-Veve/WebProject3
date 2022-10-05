import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zanpakuto/blocs/auth/auth_bloc.dart';
import 'package:zanpakuto/models/requests/login_request.dart';
import 'package:zanpakuto/models/requests/register_request.dart';
import 'package:zanpakuto/repositories/auth/auth_repository.dart';

part 'guest_state.dart';
part 'guest_cubit.freezed.dart';

class GuestCubit extends Cubit<GuestState> {
  final AuthRepository _authRepository;
  final AuthBloc _authBloc;
  GuestCubit({
    required AuthRepository authRepository,
    required AuthBloc authBloc,
  })  : _authRepository = authRepository,
        _authBloc = authBloc,
        super(const GuestState.initial());

  Future<String?> signIn(data) async {
    final response = await _authRepository
        .login(LoginRequest(email: data.email, password: data.password));
    if (response.success) {
      _authBloc.add(Authenticated(
          isAuthenticated: true,
          token: response.data!.token,
          user: response.data!.user));
      print(_authBloc.state);
      return null;
    } else {
      return response.message;
    }
  }

  Future<String?> signUp(data) async {
    final response = await _authRepository.register(RegisterRequest(
        email: data.email,
        password: data.password,
        passwordConfirmation: data.passwordConfirmation,
        username: data.username));
    if (response.success) {
      _authBloc.add(Authenticated(
          isAuthenticated: true,
          token: response.data!.token,
          user: response.data!.user));
      return null;
    } else {
      return response.message;
    }
  }

  Future<void> signOut() async {
    await _authRepository.logout();
    _authBloc.add(const Authenticated(
      isAuthenticated: false,
      token: null,
      user: null,
    ));
  }
}
