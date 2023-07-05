import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_test/models/user_model.dart';

// Define the events
abstract class UserEvent {}

// Can be used for Login or Editing
class SetUserEvent extends UserEvent {
  final User user;

  SetUserEvent(this.user);
}

class DeleteUserEvent extends UserEvent {}

// Define the states
abstract class UserState {}

class InitialUserState extends UserState {}

// Can be used for Logout, deleting some user files.
class UserSetState extends UserState {
  final User user;

  UserSetState(this.user);
}

class UserDeletedState extends UserState {}

// Define the bloc
class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(InitialUserState()) {
    on<SetUserEvent>((event, emit) => _mapSetUserEventToState(event, emit));
    on<DeleteUserEvent>(
        (event, emit) => _mapDeleteUserEventToState(event, emit));
  }

  void _mapSetUserEventToState(SetUserEvent event, Emitter<UserState> emit) {
    emit(UserSetState(event.user));
  }

  void _mapDeleteUserEventToState(
      DeleteUserEvent event, Emitter<UserState> emit) {
    emit(UserDeletedState());
  }

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    if (event is SetUserEvent) {
      yield UserSetState(event.user);
    } else if (event is DeleteUserEvent) {
      yield UserDeletedState();
    }
  }
}
