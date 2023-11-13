import 'package:bloc/bloc.dart';
import 'package:flutter_application_shop/bloc/authentication/auth_event.dart';
import 'package:flutter_application_shop/bloc/authentication/auth_state.dart';
import 'package:flutter_application_shop/data/repository/authentication_repository.dart';
import 'package:flutter_application_shop/di/di.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _repository = locator.get();
  AuthBloc() : super(AuthInitiateState()) {
    on<AuthLoginRequest>((event, emit) async {
      emit(AuthLoadingState());
      var respons = await _repository.login(event.username, event.Password);
      emit(AuthResponseState(respons));
    });
  }
}
