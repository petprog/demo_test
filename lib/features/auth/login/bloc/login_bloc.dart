import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import '../../../../core/models/requests.dart';

import '../../../../domain/auth/auth_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _loginRepository;
  LoginBloc(this._loginRepository) : super(LoginInitial()) {
    on<LoginButtonPressed>(loginEvent);
  }

  FutureOr<void> loginEvent(
      LoginButtonPressed event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    final result = await _loginRepository.login(LoginRequest(
      email: event.email,
      password: event.password,
    ));

    if (result.success) {
      emit(LoginSuccess());
    } else {
      emit(LoginFailure(error: result.error?.description));
    }
  }
}
