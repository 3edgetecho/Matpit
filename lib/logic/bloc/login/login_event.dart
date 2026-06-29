part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginEvenEmailOrPhone extends LoginEvent {
  final String text;

  const LoginEvenEmailOrPhone(this.text);

  @override
  List<Object> get props => [text];
}

class LoginEvenType extends LoginEvent {
  final String text;

  const LoginEvenType(this.text);

  @override
  List<Object> get props => [text];
}

class LoginUserType extends LoginEvent {
  final String type;

  const LoginUserType(this.type);

  @override
  List<Object> get props => [type];
}

class LoginAsGuest extends LoginEvent {
  const LoginAsGuest();
}

class LoginEventPassword extends LoginEvent {
  final String password;

  const LoginEventPassword(this.password);

  @override
  List<Object> get props => [password];
}

class LoginEventSubmit extends LoginEvent {
  const LoginEventSubmit();
}

class LoginEventLogout extends LoginEvent {
  const LoginEventLogout();
}

class LoginEventCheckProfile extends LoginEvent {
  const LoginEventCheckProfile();
}

class SentAccountActivateCodeSubmit extends LoginEvent {
  const SentAccountActivateCodeSubmit();
}
