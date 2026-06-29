part of 'sign_up_bloc.dart';

class SignUpModelState extends Equatable {
  final int agree;
  final String name;
  final String username;
  final String stateName;
  final String city;
  final String type;
  final String email;
  final String phone;
  final String countryCode;
  final String password;
  final String passwordConfirmation;
  final SignUpState state;

  const SignUpModelState({
    this.agree = 0,
    this.name = '',
    this.username = '',
    this.stateName = '',
    this.city = '',
    this.type = 'user',
    this.email = '',
    this.phone = '',
    this.countryCode = '91',
    this.password = '',
    this.passwordConfirmation = '',
    this.state = const SignUpStateInitial(),
  });

  SignUpModelState copyWith({
    int? agree,
    String? name,
    String? username,
    String? stateName,
    String? type,
    String? city,
    String? email,
    String? phone,
    String? countryCode,
    String? password,
    String? passwordConfirmation,
    SignUpState? state,
  }) {
    return SignUpModelState(
      agree: agree ?? this.agree,
      name: name ?? this.name,
      type: type ?? this.type,
      city: city ?? this.city,
      stateName: stateName ?? this.stateName,
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      countryCode: countryCode ?? this.countryCode,
      password: password ?? this.password,
      passwordConfirmation: passwordConfirmation ?? this.passwordConfirmation,
      state: state ?? this.state,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'agree': agree.toString()});
    result.addAll({'name': name.trim()});
    result.addAll({'state': stateName.trim()});
    result.addAll({'type': type.trim()});
    result.addAll({'city': city.trim()});
    result.addAll({'username': username.trim()});
    result.addAll({'email': email.trim()});
    result.addAll({'phone': countryCode + phone.trim()});
    result.addAll({'password': password});
    result.addAll({'password_confirmation': passwordConfirmation});

    return result;
  }

  SignUpModelState clear() {
    return const SignUpModelState(
      agree: 0,
      name: '',
      username: '',
      stateName: '',
      city: '',
      type: '',
      email: '',
      phone: '',
      countryCode: '',
      password: '',
      passwordConfirmation: '',
      state: SignUpStateInitial(),
    );
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'SignUpModelState(agree: $agree, name: $name,username: $username,city: $city,state: $stateName,type: $type, email: $email, phone: $phone, countryCode: $countryCode, password: $password, passwordConfirmation: $passwordConfirmation, state: $state)';
  }

  @override
  List<Object> get props {
    return [
      agree,
      name,
      username,
      stateName,
      city,
      email,
      phone,
      countryCode,
      password,
      passwordConfirmation,
      state,
    ];
  }
}

abstract class SignUpState extends Equatable {
  const SignUpState();

  @override
  List<Object> get props => [];
}

class SignUpStateInitial extends SignUpState {
  const SignUpStateInitial();
}

class SignUpStateLoading extends SignUpState {
  const SignUpStateLoading();
}

class SignUpStateLoaded extends SignUpState {
  const SignUpStateLoaded(this.msg);

  final String msg;

  @override
  List<Object> get props => [msg];
}

class SignUpStateLoadedError extends SignUpState {
  final Errors errors;

  const SignUpStateLoadedError(this.errors);

  @override
  List<Object> get props => [errors];
}

class SignUpStateFormError extends SignUpState {
  final String errorMsg;
  final int statusCode;

  const SignUpStateFormError(this.errorMsg, this.statusCode);

  @override
  List<Object> get props => [errorMsg, statusCode];
}

class AccountActivateSuccess extends SignUpState {
  final String msg;

  const AccountActivateSuccess(this.msg);

  @override
  List<Object> get props => [msg];
}

class ResendCodeState extends SignUpState {
  final String message;

  const ResendCodeState(this.message);

  @override
  List<Object> get props => [message];
}
