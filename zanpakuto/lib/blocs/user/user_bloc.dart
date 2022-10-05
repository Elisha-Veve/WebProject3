import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zanpakuto/models/models.dart';
import 'package:zanpakuto/repositories/users/user_repository.dart';

part 'user_event.dart';
part 'user_state.dart';
part 'user_bloc.freezed.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository _userRepository;
  UserBloc({
    required UserRepository userRepository,
  })  : _userRepository = userRepository,
        super(const Initial()) {
    on<UserStarted>((event, emit) async {
      final result = await _userRepository.getUsers();
      emit(Loaded(result.data ?? []));
      // TODO: implement event handler
    });
  }
}
