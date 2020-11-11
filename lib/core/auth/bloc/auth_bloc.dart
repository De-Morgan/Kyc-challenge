import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kyc/core/auth/models/user.dart';
import 'package:flutter_kyc/core/auth/service/auth_service.dart';
import 'package:flutter_kyc/network/api_error.dart';

import 'auth_state.dart';
export 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService;
  AuthCubit({AuthService authService})
      : _authService = authService ?? AuthService(),
        super(Undetermined());

  void onAppLaunch() => _reOpenApp();

  final _loadingController = StreamController<bool>.broadcast();
  Stream<bool> get authLoading => _loadingController.stream;
  StreamSink<bool> get _authLoading => _loadingController.sink;

  void navigateToSignIn() => emit(UnAuthenticatedSignIn());
  void navigateToSignUp() => emit(UnAuthenticatedSignUp());

  Future<void> _reOpenApp() async {
    //For testing
//    final mockUser = User(
//        name: "Morgan",
//        username: "Michael",
//        email: "michaeladesola",
//        kycLevel: 0);
//    emit(Authenticated(mockUser));

    navigateToSignUp();
  }

  Future<void> signUp(User user) async {
    try {
      _authLoading.add(true);
      await _authService.signUp(user);
      navigateToSignIn();
    } on ApiError catch (error) {
      emit(AuthenticationFailed(error));
    } finally {
      _authLoading.add(false);
    }
  }

  Future<void> signIn(String email, String password) async {
    try {
      _authLoading.add(true);
      final user = await _authService.signIn(email, password);
      emit(Authenticated(user));
    } on ApiError catch (error) {
      emit(AuthenticationFailed(error));
    } finally {
      _authLoading.add(false);
    }
  }
}
