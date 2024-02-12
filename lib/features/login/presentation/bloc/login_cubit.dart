import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/core/error/failures.dart';
import 'package:task/core/local/TokenUtil.dart';
import 'package:task/features/login/data/models/login_model.dart';
import 'package:task/features/login/domain/usecases/login.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final Login login;
  LoginCubit({required this.login}) : super(LoginInitial());
  LoginModel? loginModel;
  CreateLoginModel loginParams = CreateLoginModel();

  Future<void> userLogin() async {
    emit(LoginLoading());
    final failOrUser = await login(loginParams);
    failOrUser.fold((fail) {
      String message = fail is ServerFailure ? fail.message : "Error happend";
      emit(LoginError(message: message));
    }, (loginDataModel) {
      TokenUtil.saveToken(loginDataModel.accessToken ?? '');
      loginModel = loginDataModel;
      log(loginModel.toString());
      loginParams = CreateLoginModel();
      emit(LoginSuccess());
    });
  }
}
