abstract class AuthEvent {}

class AuthLoginRequest extends AuthEvent {
  String username;
  String Password;
  AuthLoginRequest(this.username, this.Password);
}
