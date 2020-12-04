import 'package:equatable/equatable.dart';

abstract class SignInState extends Equatable {
  SignInState();

  @override
  List<Object> get props => [];
}

class SignInEmpty extends SignInState {}
class SignInLoading extends SignInState {}
class SignInSuccess extends SignInState {}
class SignInFailure extends SignInState {}

// class SignInSuccess extends SignInState {
//   final CurrentUser currentUser;
//
//   SignInSuccess(this.currentUser);
//
//   @override
//   List<Object> get props => [currentUser];
//
//   @override
//   String toString() {
//     return "SignInSuccess";
//   }
// }
//
// class SignInFailure extends SignInState {
//   // final Error error;
//   //
//   // SignInFailure({@required this.error})
//   //     : assert(error != null);
//   //
//   // @override
//   // List<Object> get props => [error];
//
//   @override
//   String toString() {
//     return "SignInFailure";
//   }
// }
