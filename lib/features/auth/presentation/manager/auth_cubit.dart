import 'package:bloc/bloc.dart';
import 'package:lms/features/auth/domain/use_cases/auth.dart';
import 'package:meta/meta.dart';

import '../../../../core/helpers/shared_pref_helper.dart';
import '../../domain/entities/user_entity.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authUseCase) : super(AuthInitial());
  final AuthUseCase authUseCase;

  Future<void> signIn(String email, String password) async {
    emit(AuthLoadingSignIn());
    final result = await authUseCase.callSignIn(email, password);
    result.fold((failure) => emit(AuthErrorSignIn(failure.message)), (user) {
      SharedPrefHelper.setSecuredString("token", user.uid);
      emit(AuthSuccessSignIn(user));
    });
  }

  Future<void> signUp(String email, String password, String name) async {
    emit(AuthLoadingSignUp());
    final result = await authUseCase.callSignUp(email, password, name);
    result.fold((failure) => emit(AuthErrorSignUp(failure.message)), (user) {
      SharedPrefHelper.setSecuredString("token", user.uid);
      emit(AuthSuccessSignUp(user));
    });
  }
}
