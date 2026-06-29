// import 'dart:convert';
//
// import 'package:equatable/equatable.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../../../data/model/auth/auth_error_model.dart';
// import '../../../data/model/auth/user_login_response_model.dart';
// import '../../../presentation/error/failure.dart';
// import '../../repository/auth_repository.dart';
// import '../../repository/profile_repository.dart';
//
// part 'login_event.dart';
// part 'login_state.dart';
//
// class LoginBloc extends Bloc<LoginEvent, LoginModelState> {
//   final AuthRepository _authRepository;
//   final ProfileRepository _profileRepository;
//
//   UserLoginResponseModel? _user;
//
//   bool get isLogedIn => _user != null && _user!.accessToken.isNotEmpty;
//
//   UserLoginResponseModel? get userInfo => _user;
//
//   set user(UserLoginResponseModel userData) => _user = userData;
//
//   LoginBloc({
//     required AuthRepository authRepository,
//     required ProfileRepository profileRepository,
//   })  : _authRepository = authRepository,
//         _profileRepository = profileRepository,
//         super(const LoginModelState()) {
//     on<LoginEvenEmailOrPhone>((event, emit) {
//       emit(state.copyWith(text: event.text, state: const LoginStateInitial()));
//     });
//     on<LoginUserType>((event, emit) {
//       emit(state.copyWith(type: event.type, state: const LoginStateInitial()));
//     });
//     on<LoginEventPassword>((event, emit) {
//       emit(state.copyWith(
//           password: event.password, state: const LoginStateInitial()));
//     });
//     on<LoginEventSubmit>(_submitLoginForm);
//     on<SentAccountActivateCodeSubmit>(_sentAccountActivateCode);
//     on<LoginEventLogout>(_logOut);
//     on<LoginEventCheckProfile>(_getUserInfo);
//
//     /// set user data if user already login
//
//     final result = _authRepository.getCashedUserInfo();
//
//     result.fold(
//       (l) => _user = null,
//       (r) {
//         user = r;
//       },
//     );
//   }
//
//   Future<void> _getUserInfo(
//     LoginEventCheckProfile event,
//     Emitter<LoginModelState> emit,
//   ) async {
//     final result = _authRepository.getCashedUserInfo();
//
//     result.fold(
//       (l) => _user = null,
//       (r) {
//         user = r;
//         emit(state.copyWith(state: LoginStateLoaded(r)));
//       },
//     );
//   }
//
//   Future<void> _submitLoginForm(
//     LoginEventSubmit event,
//     Emitter<LoginModelState> emit,
//   ) async {
//     emit(state.copyWith(state: const LoginStateLoading()));
//     final bodyData = state.toMap();
//     print(bodyData);
//
//     final result = await _authRepository.login(bodyData);
//
//     result.fold(
//       (failure) {
//         if (failure is InvalidAuthData) {
//           final errors = LoginStateFormInvalid(failure.errors);
//           emit(state.copyWith(state: errors));
//         } else {
//           final error = LoginStateError(failure.message, failure.statusCode);
//           emit(state.copyWith(state: error));
//         }
//       },
//       (user) {
//         final loadedData = LoginStateLoaded(user);
//         _user = user;
//         emit(state.copyWith(state: loadedData));
//
//         emit(state.copyWith(
//           text: '',
//           password: '',
//           state: const LoginStateInitial(),
//         ));
//       },
//     );
//   }
//
//   Future<void> _sentAccountActivateCode(
//     SentAccountActivateCodeSubmit event,
//     Emitter<LoginModelState> emit,
//   ) async {
//     emit(state.copyWith(state: const LoginStateLoading()));
//
//     final result = await _authRepository.sendActiveAccountCode(state.text);
//
//     result.fold(
//       (Failure failure) {
//         final error = LoginStateError(failure.message, failure.statusCode);
//         emit(state.copyWith(state: error));
//       },
//       (String success) {
//         final loadedData = SendAccountCodeSuccess(success);
//         emit(state.copyWith(state: loadedData));
//       },
//     );
//   }
//
//   Future<void> _logOut(
//     LoginEventLogout event,
//     Emitter<LoginModelState> emit,
//   )
//   async {
//     if (_user != null && _user!.type == "guest") {
//       _user = null;
//       emit(state.copyWith(
//         state: const LoginStateLogOut('logout success', 200),
//       ));
//       return;
//     }
//     emit(state.copyWith(state: const LoginStateLogOutLoading()));
//
//     final result = await _authRepository.logOut(userInfo!.accessToken);
//
//     result.fold(
//       (Failure failure) {
//         if (failure.statusCode == 500) {
//           const loadedData = LoginStateLogOut('logout success', 200);
//           emit(state.copyWith(state: loadedData));
//         } else {
//           final error =
//               LoginStateSignOutError(failure.message, failure.statusCode);
//           emit(state.copyWith(state: error));
//         }
//       },
//       (String success) {
//         _user = null;
//         final loadedData = LoginStateLogOut(success, 200);
//         emit(state.copyWith(state: loadedData));
//       },
//     );
//   }
//
//
// }


import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/auth/auth_error_model.dart';
import '../../../data/model/auth/user_login_response_model.dart';
import '../../../data/model/auth/user_profile_model.dart';
import '../../../presentation/error/failure.dart';
import '../../repository/auth_repository.dart';
import '../../repository/profile_repository.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginModelState> {
  final AuthRepository _authRepository;
  final ProfileRepository _profileRepository;

  UserLoginResponseModel? _user;

  bool get isLogedIn => _user != null && _user!.accessToken.isNotEmpty;

  UserLoginResponseModel? get userInfo => _user;

  set user(UserLoginResponseModel userData) => _user = userData;

  LoginBloc({
    required AuthRepository authRepository,
    required ProfileRepository profileRepository,
  })  : _authRepository = authRepository,
        _profileRepository = profileRepository,
        super(const LoginModelState()) {

    /// 🔹 Text Change
    on<LoginEvenEmailOrPhone>((event, emit) {
      emit(state.copyWith(
        text: event.text,
        state: const LoginStateInitial(),
      ));
    });

    /// 🔹 User Type Change
    on<LoginUserType>((event, emit) {
      emit(state.copyWith(
        type: event.type,
        state: const LoginStateInitial(),
      ));
    });

    /// 🔹 Password Change
    on<LoginEventPassword>((event, emit) {
      emit(state.copyWith(
        password: event.password,
        state: const LoginStateInitial(),
      ));
    });

    /// 🔹 Submit Login
    on<LoginEventSubmit>(_submitLoginForm);

    /// 🔹 Guest Login
    on<LoginAsGuest>(_loginAsGuest);

    /// 🔹 Send Activation Code
    on<SentAccountActivateCodeSubmit>(_sentAccountActivateCode);

    /// 🔹 Logout
    on<LoginEventLogout>(_logOut);

    /// 🔹 Check Profile
    on<LoginEventCheckProfile>(_getUserInfo);

    /// 🔹 Load Cached User (App Start)
    final result = _authRepository.getCashedUserInfo();

    result.fold(
          (l) => _user = null,
          (r) {
        user = r;
      },
    );
  }

  // ============================================================
  // 🔹 CHECK CACHED USER
  // ============================================================

  Future<void> _getUserInfo(
      LoginEventCheckProfile event,
      Emitter<LoginModelState> emit,
      ) async {

    final result = _authRepository.getCashedUserInfo();

    result.fold(
          (l) => _user = null,
          (r) {
        _user = r;
        emit(state.copyWith(
          state: LoginStateLoaded(r),
        ));
      },
    );
  }

  // ============================================================
  // 🔹 NORMAL LOGIN
  // ============================================================

  Future<void> _submitLoginForm(
      LoginEventSubmit event,
      Emitter<LoginModelState> emit,
      ) async {

    emit(state.copyWith(state: const LoginStateLoading()));

    final bodyData = state.toMap();

    final result = await _authRepository.login(bodyData);

    result.fold(
          (failure) {
        if (failure is InvalidAuthData) {
          emit(state.copyWith(
            state: LoginStateFormInvalid(failure.errors),
          ));
        } else {
          emit(state.copyWith(
            state: LoginStateError(
              failure.message,
              failure.statusCode,
            ),
          ));
        }
      },
          (user) {
        _user = user;

        emit(state.copyWith(
          state: LoginStateLoaded(user),
        ));

        /// reset form
        emit(state.copyWith(
          text: '',
          password: '',
          state: const LoginStateInitial(),
        ));
      },
    );
  }

  // ============================================================
  // 🔹 GUEST LOGIN (FIXED)
  // ============================================================

  Future<void> _loginAsGuest(
      LoginAsGuest event,
      Emitter<LoginModelState> emit,
      ) async {

    emit(state.copyWith(state: const LoginStateLoading()));

    await Future.delayed(const Duration(milliseconds: 300));

    final guestProfile = UserProfileModel(
      id: 0,
      name: "Guest User",
      email: "",
    );

    final guestUser = UserLoginResponseModel(
      accessToken: '',
      tokenType: '',
      expiresIn: 0,
      type: "guest",
      user: guestProfile,  // ✅ not null anymore
    );

    _user = guestUser;

    emit(state.copyWith(
      state: LoginStateLoaded(guestUser),
    ));
  }


  // ============================================================
  // 🔹 SEND ACCOUNT CODE
  // ============================================================

  Future<void> _sentAccountActivateCode(
      SentAccountActivateCodeSubmit event,
      Emitter<LoginModelState> emit,
      ) async {

    emit(state.copyWith(state: const LoginStateLoading()));

    final result =
    await _authRepository.sendActiveAccountCode(state.text);

    result.fold(
          (Failure failure) {
        emit(state.copyWith(
          state: LoginStateError(
            failure.message,
            failure.statusCode,
          ),
        ));
      },
          (String success) {
        emit(state.copyWith(
          state: SendAccountCodeSuccess(success),
        ));
      },
    );
  }

  // ============================================================
  // 🔹 LOGOUT (CRASH SAFE VERSION)
  // ============================================================

  Future<void> _logOut(
      LoginEventLogout event,
      Emitter<LoginModelState> emit,
      ) async {

    /// 🔴 If no user
    if (_user == null) {
      emit(state.copyWith(
        state: const LoginStateLogOut('logout success', 200),
      ));
      return;
    }

    /// 🔴 If Guest
    if (_user!.type == "guest") {
      _user = null;

      emit(state.copyWith(
        state: const LoginStateLogOut('logout success', 200),
      ));
      return;
    }

    emit(state.copyWith(state: const LoginStateLogOutLoading()));

    final result =
    await _authRepository.logOut(_user!.accessToken);

    result.fold(
          (Failure failure) {
        _user = null;

        emit(state.copyWith(
          state: const LoginStateLogOut('logout success', 200),
        ));
      },
          (String success) {
        _user = null;

        emit(state.copyWith(
          state: LoginStateLogOut(success, 200),
        ));
      },
    );
  }
}